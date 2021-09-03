<template>
  <div>
    <a-card>
      <a-table
        rowKey="ID"
        :columns="columns"
        :pagination="pagination"
        :dataSource="commentList"
        bordered
        @change="handleTableChange"
      >
        <span slot="status" slot-scope="data">{{ data == 1 ? '审核通过' : '未审核' }}</span>
        <template slot="action" slot-scope="data">
          <div class="actionSlot">
            <a-button
              type="primary"
              icon="edit"
              style="margin-right: 15px"
              @click="commentCheck(data.ID)"
            >通过审核</a-button>
            <a-button
              type="primary"
              icon="info"
              style="margin-right: 15px"
              @click="commentUncheck(data.ID)"
            >撤下评论</a-button>
            <a-button
              type="danger"
              icon="delete"
              style="margin-right: 15px"
              @click="deleteComment(data.ID)"
            >删除</a-button>
          </div>
        </template>
      </a-table>
    </a-card>
  </div>
</template>
<script>
import day from 'dayjs'
const columns = [
  {
    title: 'ID',
    dataIndex: 'ID',
    width: '2%',
    key: 'id',
    align: 'center',
  },
  {
    title: '创建时间',
    dataIndex: 'CreatedAt',
    width: '10%',
    key: 'CreatedAt',
    align: 'center',
    customRender: (val) => {
      return val ? day(val).format('YYYY年MM月DD日 HH:mm') : '暂无'
    },
  },
  {
    title: '评论文章',
    dataIndex: 'article_title',
    width: '7%',
    key: 'article_title',
    align: 'center',
  },
  {
    title: '评论者',
    dataIndex: 'username',
    width: '7%',
    key: 'username',
    align: 'center',
  },
  {
    title: '评论内容',
    dataIndex: 'content',
    width: '20%',
    key: 'content',
    align: 'center',
  },
  {
    title: '评论状态',
    dataIndex: 'status',
    width: '7%',
    key: 'status',
    align: 'center',
    scopedSlots: { customRender: 'status' },
  },
  {
    title: '操作',
    width: '20%',
    key: 'action',
    align: 'center',
    scopedSlots: { customRender: 'action' },
  },
]
export default {
  data() {
    return {
      commentList: [],
      commentInfo: {
        status: 1,
      },
      pagination: {
        pageSizeOptions: ['5', '10', '20'],
        pageSize: 5,
        total: 0,
        showSizeChanger: true,
        showTotal: (total) => `共${total}条`,
      },
      columns,
      queryParam: {
        pagesize: 10,
        pagenum: 1,
      },
    }
  },
  created() {
    this.getCommentList()
  },
  methods: {
    // 获取评论列表
    async getCommentList() {
      const { data: res } = await this.$http.get('comment/list', {
        params: {
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum,
        },
      })

      if (res.status !== 200) {
        if (res.status === 1004 || 1005 || 1006 || 1007) {
          window.sessionStorage.clear()
          this.$router.push('/login')
        }
        this.$message.error(res.message)
      }
      this.commentList = res.data
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
      this.getCommentList()
    },

    // 通过审核
    commentCheck(id) {
      this.$confirm({
        title: '提示：请再次确认',
        content: '要通过审核吗？',
        onOk: async () => {
          const { data: res_status } = await this.$http.get(`comment/info/${id}`)
          if (res_status.data.status === 1) return this.$message.error('该评论已处于显示状态，无需审核')
          const { data: res } = await this.$http.put(`checkcomment/${id}`, {
            status: 1,
          })
          if (res.status != 200) return this.$message.error(res.message)
          this.$message.success('审核成功')
          this.getCommentList()
        },
        onCancel: () => {
          this.$message.info('已取消')
        },
      })
    },

    // 撤下评论
    commentUncheck(id) {
      this.$confirm({
        title: '提示：请再次确认',
        content: '要撤下该评论吗？',
        onOk: async () => {
          const { data: res_status } = await this.$http.get(`comment/info/${id}`)
          if (res_status.data.status === 2) return this.$message.error('该评论已处于未审核状态，无需撤下')
          const { data: res } = await this.$http.put(`uncheckcomment/${id}`, {
            status: 2,
          })
          if (res.status != 200) return this.$message.error(res.message)
          this.$message.success('评论已撤下')
          this.getCommentList()
        },
        onCancel: () => {
          this.$message.info('已取消')
        },
      })
    },

    // 删除评论
    deleteComment(id) {
      this.$confirm({
        title: '提示：请再次确认',
        content: '要删除吗？',
        onOk: async () => {
          const { data: res } = await this.$http.delete(`delcomment/${id}`)
          if (res.status != 200) return this.$message.error(res.message)
          this.$message.success('删除成功')
          this.getCommentList()
        },
        onCancel: () => {
          this.$message.info('已取消')
        },
      })
    },
  },
}
</script>
<style lang="">
</style>
