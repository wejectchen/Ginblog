<template>
  <div>
    <h3>用户列表页面</h3>
    <a-card>
      <a-row :gutter="20">
        <a-col :span="6">
          <a-input-search
            v-model="queryParam.username"
            placeholder="输入用户名查找"
            enter-button
            allowClear
            @search="getUserList"
          />
        </a-col>
        <a-col :span="4">
          <a-button type="primary">新增</a-button>
        </a-col>
      </a-row>

      <a-table
        rowKey="username"
        :columns="columns"
        :pagination="pagination"
        :dataSource="userlist"
        bordered
        @change="handleTableChange"
      >
        <span slot="role" slot-scope="role">{{role == 1 ? '管理员':'订阅者'}}</span>
        <template slot="action" slot-scope="data">
          <div class="actionSlot">
            <a-button type="primary" style="margin-right:15px" @click="editUser(data.ID)">编辑</a-button>
            <a-button type="danger" @click="deleteUser(data.ID)">删除</a-button>
          </div>
        </template>
      </a-table>
    </a-card>

    <!-- 编辑用户对话框 -->
    <a-modal
      width="60%"
      closable
      v-model="editVisible"
      title="编辑用户"
      @ok="editOk"
      @cancel="editCancel"
      :destroyOnClose="true"
    >
      <a-form-model ref="editUserRef" :rules="editUserRules" :model="userInfo">
        <a-form-model-item label="用户名">
          <a-input disabled v-model="userInfo.username"></a-input>
        </a-form-model-item>
        <a-form-model-item has-feedback label="修改密码" prop="password">
          <a-input-password v-model="userInfo.password" type="password" placeholder="请修改密码"></a-input-password>
        </a-form-model-item>
        <a-form-model-item has-feedback label="确认修改密码" prop="checkPass">
          <a-input-password v-model="userInfo.checkPass" placeholder="再次输入密码确认" autocomplete="off"></a-input-password>
        </a-form-model-item>
        <a-form-model-item label="是否为管理员" prop="role">
          <a-select defaultValue="2" style="width: 120px" @change="editAdminChange">
            <a-select-option key="1" value="1">是</a-select-option>
            <a-select-option key="2" value="2">否</a-select-option>
          </a-select>
        </a-form-model-item>
      </a-form-model>
    </a-modal>
  </div>
</template>

<script>
const columns = [
  {
    title: 'ID',
    dataIndex: 'ID',
    width: '10%',
    key: 'id',
    align: 'center',
  },
  {
    title: '用户名',
    dataIndex: 'username',
    width: '20%',
    key: 'username',
    align: 'center',
  },
  {
    title: '角色',
    dataIndex: 'role',
    width: '20%',
    key: 'role',
    align: 'center',
    scopedSlots: { customRender: 'role' },
  },
  {
    title: '操作',
    width: '30%',
    key: 'action',
    align: 'center',
    scopedSlots: { customRender: 'action' },
  },
]

export default {
  data() {
    return {
      pagination: {
        pageSizeOptions: ['5', '10', '20'],
        pageSize: 5,
        total: 0,
        showSizeChanger: true,
        showTotal: (total) => `共${total}条`,
      },
      userlist: [],
      userInfo: {
        username: '',
        password: '',
        role: 0,
        checkPass: '',
      },
      columns,
      queryParam: {
        username: '',
        pagesize: 5,
        pagenum: 1,
      },
      editVisible: false,
      editUserRules: {
        password: [
          {
            validator: (rule, value, callback) => {
              if (this.userInfo.password === '') {
                callback(new Error('请输入密码'))
              }
              if ([...this.userInfo.password].length < 6 || [...this.userInfo.password].length > 20) {
                callback(new Error('密码应当在6到20个字符之间'))
              } else {
                callback()
              }
            },
            trigger: 'blur',
          },
        ],
        checkPass: [
          {
            validator: (rule, value, callback) => {
              if (this.userInfo.checkPass === '') {
                callback(new Error('请输入密码'))
              }
              if (this.userInfo.checkPass !== this.userInfo.password) {
                callback(new Error('密码与之前输入不一致'))
              } else {
                callback()
              }
            },
            trigger: 'blur',
          },
        ],
      },
    }
  },
  created() {
    this.getUserList()
  },
  methods: {
    // 获取用户列表
    async getUserList() {
      const { data: res } = await this.$http.get('users', {
        params: {
          username: this.queryParam.username,
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum,
        },
      })
      if (res.status != 200) return this.$message.error(res.message)
      this.userlist = res.data
      this.pagination.total = res.total
    },
    // 更改分页
    handleTableChange(pagination, filters, sorter) {
      var pager = { ...this.pagination }
      pager.current = pagination.current
      pager.pageSize = pagination.pageSize
      this.queryParam.pagesize = pagination.pageSize
      this.queryParam.pagenum = pagination.current

      if (pagination.pageSize !== this.pagination.pageSize) {
        this.queryParam.pagenum = 1
        pager.current = 1
      }
      this.pagination = pager
      this.getUserList()
    },
    // 删除用户
    deleteUser(id) {
      this.$confirm({
        title: '提示：请再次确认',
        content: '确定要删除该用户吗？一旦删除，无法恢复',
        onOk: async () => {
          const res = await this.$http.delete(`user/${id}`)
          if (res.status != 200) return this.$message.error(res.message)
          this.$message.success('删除成功')
          this.getUserList()
        },
        onCancel: () => {
          this.$message.info('已取消删除')
        },
      })
    },

    // 编辑用户
    async editUser(id) {
      const { data: res } = await this.$http.get(`user/${id}`)
      this.userInfo = res.data
      this.userInfo.password = ''
      this.editVisible = true
    },
    editAdminChange(value) {
      this.userInfo.role = value
    },
    editCancel() {
      this.$message.info('编辑已取消')
      this.editVisible = false
    },
    async editOk() {
      await this.$nextTick(() => {
        console.log(this.$refs)
        this.$refs.editUserRef.validate((valid) => {
          console.log(valid)
        })
      })

      this.editVisible = false
    },
  },
}
</script>

<style scoped>
.actionSlot {
  display: flex;
  justify-content: center;
}
</style>