<template>
  <div>
    <h3>用户列表页面</h3>
    <a-card>
      <a-row :gutter="20">
        <a-col :span="6">
          <a-input-search
            v-model="queryParam.username"
            placeholder="输入用户名查找"
            allowClear
            enter-button
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
            <!--  @search="onSearch" -->
            <a-button type="primary" style="margin-right:15px" @click="showModal(data.ID)">编辑</a-button>
            <a-button type="danger" @click="deleteUser(data.id)">删除</a-button>

            <!-- 编辑对话框 -->
            <a-modal
              width="50%"
              title="编辑用户"
              :visible="visible"
              @ok="handleOk"
              @cancel="handleCancel"
            >
              <a-form-model>
                <a-form-model-item label="用户名">
                  <a-input></a-input>
                  {{data}}
                </a-form-model-item>
              </a-form-model>
            </a-modal>
          </div>
        </template>
      </a-table>
    </a-card>
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
      columns,
      queryParam: {
        username: '',
        pagesize: 5,
        pagenum: 1,
      },
      visible: false,
    }
  },
  created() {
    this.getUserList()
  },
  methods: {
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

    handleTableChange(pagination, filters, sorter) {
      const pager = { ...this.pagination }
      pager.current = pagination.current
      pager.pageSize = pagination.pageSize
      if (pagination.pageSize !== this.pagination.pageSize) {
        pager.current = 1
      }
      this.pagination = pager
      this.getUserList()
    },

    deleteUser(ID) {
      this.$confirm({
        title: '确定删除该用户?',
        content: '一旦删除，无法恢复',
        onOk: async () => {
          const { data: res } = await this.$http.delete(`user/${ID}`)
          if (res.status != 200) return this.$message.error(res.message)
          this.$message.success('删除成功！')
          this.getUserList()
        },
        onCancel: () => {
          this.$message.info('删除已取消')
        },
      })
    },

    showModal() {
      this.visible = true
    },
    handleOk(e) {
      this.visible = false
    },
    handleCancel() {
      this.visible = false
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