<template>
  <v-container>
    <div v-if="total == 0 && isLoad" class="d-flex justify-center align-center">
      <div>
        <v-alert class="ma-5" dense outlined type="error"
          >抱歉，暂无数据！</v-alert
        >
      </div>
    </div>
    <v-sheet>
      <v-card
        class="ma-3"
        v-for="item in artList"
        :key="item.id"
        link
        @click="$router.push(`/article/detail/${item.ID}`)"
      >
        <v-row no-gutters class="d-flex align-center">
          <v-avatar class="ma-3 hidden-sm-and-down" size="125" tile>
            <v-img :src="item.img"></v-img>
          </v-avatar>
          <v-col>
            <v-card-title>
              <v-chip color="purple" outlined label class="mr-3 white--text">{{
                item.Category.name
              }}</v-chip>
              <div>{{ item.title }}</div>
            </v-card-title>
            <v-card-subtitle class="mt-1" v-text="item.desc"></v-card-subtitle>
            <v-divider class="mx-4"></v-divider>
            <v-card-text class="d-flex align-center">
              <div class="d-flex align-center">
                <v-icon class="mr-1" small>{{ 'mdi-calendar-month' }}</v-icon>
                <span>{{
                  item.CreatedAt | dateformat('YYYY-MM-DD HH:MM')
                }}</span>
              </div>
              <div class="mx-4 d-flex align-center">
                <v-icon class="mr-1" small>{{ 'mdi-comment' }}</v-icon>
                <span>{{ item.comment_count }}</span>
              </div>
              <div class="mx-1 d-flex align-center">
                <v-icon class="mr-1" small>{{ 'mdi-eye' }}</v-icon>
                <span>{{ item.read_count }}</span>
              </div>
            </v-card-text>
          </v-col>
        </v-row>
      </v-card>
      <v-col>
        <div class="text-center">
          <v-pagination
            total-visible="7"
            v-model="queryParam.pagenum"
            :length="Math.ceil(total / queryParam.pagesize)"
            @input="getArtList()"
          ></v-pagination>
        </div>
      </v-col>
    </v-sheet>
  </v-container>
</template>
<script>
export default {
  props: ['cid'],
  data() {
    return {
      artList: [],
      queryParam: {
        pagesize: 5,
        pagenum: 1
      },
      total: 0,
      isLoad: false
    }
  },
  mounted() {
    this.getArtList()
  },
  methods: {
    // 获取文章列表
    async getArtList() {
      const { data: res } = await this.$http.get(`article/list/${this.cid}`, {
        params: {
          pagesize: this.queryParam.pagesize,
          pagenum: this.queryParam.pagenum
        }
      })
      this.artList = res.data
      this.total = res.total
      this.isLoad = true
    }
  }
}
</script>
<style scoped>
.nodate {
  width: 100%;
  height: 100%;
}
</style>
