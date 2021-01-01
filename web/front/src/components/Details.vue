<template >
  <div>
    <div class="d-flex justify-center pa-3 text-h4 font-weight-bold">{{artInfo.title}}</div>
    <div class="d-flex justify-center align-center">
      <div class="d-flex justify-center">
        <v-icon class="mr-1" small>{{'mdi-calendar-month'}}</v-icon>
        <span>{{artInfo.CreatedAt | dateformat('YYYY-MM-DD HH:MM')}}</span>
      </div>
    </div>
    <v-divider class="pa-3 ma-3"></v-divider>
    <v-alert class="ma-4" elevation="1" color="indigo" dark border="left" outlined>{{artInfo.desc}}</v-alert>
    <div class="content_box">
      <div class="content ma-5 pa-3 text-justify" v-html="artInfo.content"></div>
    </div>

    <v-divider class="ma-5"></v-divider>
    <v-sheet class="ma-3 pa-3">
      <div>
        <v-list outlined class="ma-3 pa-3" v-for="item in commentList" :key="item.ID">
          <v-list-item>
            <v-list-item-content>
              <v-list-item-title>{{item.username}} {{item.CreatedAt | dateformat('YYYY-MM-DD HH:MM')}}</v-list-item-title>
              <v-list-item-subtitle class="mr-3">{{item.content}}</v-list-item-subtitle>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </div>
      <div class="text-center">
        <v-pagination
          class="my-2"
          total-visible="7"
          v-model="queryParam.pagenum"
          :length="Math.ceil(total/queryParam.pagesize)"
          @input="getArtList()"
        ></v-pagination>
      </div>
      <div>
        <v-card flat>
          <v-text-field
            class="mx-3"
            max-width="20vw"
            v-model="comment.username"
            placeholder="请输入昵称"
          ></v-text-field>
          <v-textarea class="mx-3" outlined v-model="comment.content"></v-textarea>
          <v-btn class="mx-3 mb-3" dark color="indigo" small @click="pushComment">确定</v-btn>
        </v-card>
      </div>
    </v-sheet>
  </div>
</template>
<script>
export default {
  props: ['id'],
  data() {
    return {
      artInfo: {},
      commentList: [],
      comment: {
        username: '',
        article_id: this.id,
        content: ''
      },
      total: 0,
      queryParam: {
        pagesize: 5,
        pagenum: 1
      }
    }
  },
  created() {
    this.getArtInfo()
    this.getCommentList()
  },
  methods: {
    // 查询文章
    async getArtInfo() {
      const { data: res } = await this.$http.get(`article/info/${this.id}`)
      this.artInfo = res.data
    },
    // 获取评论
    async getCommentList() {
      const { data: res } = await this.$http.get('comment', {
        pagesize: this.queryParam.pagesize,
        pagenum: this.queryParam.pagenum
      })
      this.commentList = res.data
      console.log('this.commentList: ', this.commentList)
      this.total = res.total
    },
    // 发送评论
    async pushComment() {}
  }
}
</script>
<style scoped>
.content_box {
  max-width: 100%;
}

.content >>> img {
  width: auto;
  max-width: 100%;
}
</style>