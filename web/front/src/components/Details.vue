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
    <div class="content ma-5 pa-3 text-justify" v-html="artInfo.content"></div>
  </div>
</template>
<script>
export default {
  props: ['id'],
  data() {
    return {
      artInfo: {}
    }
  },
  created() {
    this.getArtInfo()
  },
  methods: {
    // 查询文章
    async getArtInfo() {
      const { data: res } = await this.$http.get(`article/info/${this.id}`)
      this.artInfo = res.data
    }
  }
}
</script>
<style scoped>
.content {
  width: 90%;
}
.content >>> img,
span,
p {
  width: 100%;
}
</style>