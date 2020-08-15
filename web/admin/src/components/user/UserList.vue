<template>
  <div>
<<<<<<< HEAD
    <h3>用户列表</h3>
    <a-card>
      <a-row :gutter="20">
        <a-col :span="8">
          <a-input-search placeholder="输入查找用户名" enter-button @search="onSearch" />
        </a-col>
        <a-col :span="4">
          <a-button type="primary">新增用户</a-button>
=======
    <h3>用户列表页面</h3>
    <a-card>
      <a-row :gutter="20">
        <a-col :span="6">
          <a-input-search placeholder="输入用户名查找" enter-button />
        </a-col>
        <a-col :span="4">
          <a-button type="primary">新增</a-button>
>>>>>>> webdevl
        </a-col>
      </a-row>

      <a-table
<<<<<<< HEAD
        :columns="columns"
        :dataSource="userlist"
        rowKey="username"
        bordered
        :pagination="paginationOption"
      >
        <span slot="role" slot-scope="role">{{role==1? '管理员':'订阅者'}}</span>
        <template slot="action">
          <div class="ActionSlot">
            <a-button type="primary" style="margin-right:10px">编辑</a-button>
=======
        rowKey="username"
        :columns="columns"
        :pagination="paginationOption"
        :dataSource="userlist"
        bordered
      >
        <span slot="role" slot-scope="role">{{role == 1 ? '管理员':'订阅者'}}</span>
        <template slot="action">
          <div class="actionSlot">
            <a-button type="primary" style="margin-right:15px">编辑</a-button>
>>>>>>> webdevl
            <a-button type="danger">删除</a-button>
          </div>
        </template>
      </a-table>
    </a-card>
  </div>
</template>

<script>
const columns = [
  {
<<<<<<< HEAD
    title: 'Id',
    key: 'id',
    dataIndex: 'ID',
    width: '10%',
  },
  {
    title: '用户名',
    key: 'username',
    dataIndex: 'username',
    width: '20%',
=======
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
>>>>>>> webdevl
  },
  {
    title: '角色',
    dataIndex: 'role',
<<<<<<< HEAD
    key: 'role',
    width: '20%',
=======
    width: '20%',
    key: 'role',
    align: 'center',
>>>>>>> webdevl
    scopedSlots: { customRender: 'role' },
  },
  {
    title: '操作',
<<<<<<< HEAD
    key: 'action',
    width: '20%',
    scopedSlots: { customRender: 'action' },
  },
]
=======
    width: '30%',
    key: 'action',
    align: 'center',
    scopedSlots: { customRender: 'action' },
  },
]

>>>>>>> webdevl
export default {
  data() {
    return {
      paginationOption: {
        pageSizeOptions: ['5', '10', '20'],
        defaultCurrent: 1,
        defaultPageSize: 5,
        total: 0,
        showSizeChanger: true,
<<<<<<< HEAD
        showTotal: (total) => `共 ${total} 条`,
        onChange: (current, size) => {
          this.paginationOption.defaultCurrent = current
          this.paginationOption.defaultPageSize = size
        },
        onShowSizeChange(current, pageSize) {
          this.paginationOption = pageSize
=======
        showTotal: (total) => `共${total}条`,
        onChage: (current, pageSize) => {
          this.paginationOption.defaultCurrent = current
          this.paginationOption.defaultPageSize = pageSize
          this.getUserList()
        },
        onshowSizeChange: (current, size) => {
          this.paginationOption.defaultCurrent = current
          this.paginationOption.defaultPageSize = size
          this.getUserList()
>>>>>>> webdevl
        },
      },

      userlist: [],
      columns,
    }
  },
  created() {
    this.getUserList()
  },
  methods: {
    async getUserList() {
      const { data: res } = await this.$http.get('users', {
<<<<<<< HEAD
        params: { pagesize: this.paginationOption.defaultPageSize, pagenum: this.paginationOption.defaultCurrent },
      })
      if (res.status != 200) return this.$message.error(res.message)
      this.paginationOption.total = res.total
      this.userlist = res.data
    },
    onSearch() {},
=======
        params: {
          pagesize: this.paginationOption.defaultPageSize,
          pagenum: this.paginationOption.defaultCurrent,
        },
      })
      if (res.status != 200) return this.$message.error(res.message)
      this.userlist = res.data
      this.paginationOption.total = res.total
    },
>>>>>>> webdevl
  },
}
</script>

<style scoped>
<<<<<<< HEAD
.ActionSlot {
=======
.actionSlot {
>>>>>>> webdevl
  display: flex;
  justify-content: center;
}
</style>