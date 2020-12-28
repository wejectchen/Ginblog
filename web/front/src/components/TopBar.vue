<template>
  <div>
    <v-app-bar app color="indigo darken-2">
      <v-avatar class="mx-12" size="40" color="grey"></v-avatar>
      <v-container class="py-0 fill-height justify-center">
        <v-btn text color="white" @click="$router.push('/')">首页</v-btn>
        <v-btn
          v-for="item in cateList"
          :key="item.id"
          text
          color="white"
          @click="gotoCate(item.id)"
        >{{item.name}}</v-btn>
      </v-container>

      <v-spacer></v-spacer>

      <v-responsive max-width="260" color="white">
        <v-text-field
          dense
          flat
          hide-details
          solo-inverted
          rounded
          placeholder="请输入文章标题查找"
          dark
          append-icon="mdi-text-search"
          v-model="searchName"
          @change="searchTitle(searchName)"
        ></v-text-field>
      </v-responsive>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cateList: [],
      searchName: ''
    }
  },
  created() {
    this.GetCateList()
  },
  methods: {
    // 获取分类
    async GetCateList() {
      const { data: res } = await this.$http.get('category')
      this.cateList = res.data
    },

    // 查找文章标题
    searchTitle(title) {
      this.$router.push(`/search/${title}`)
    },

    gotoCate(cid) {
      this.$router.push(`/category/${cid}`).catch((err) => err)
    }
  }
}
</script>

<style>
</style>