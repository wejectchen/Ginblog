<template>
  <div>
    <v-app-bar app color="primary" flat>
      <v-avatar size="40" color="grey"></v-avatar>
      <v-container class="py-0 fill-height">
        <v-btn text color="white">首页</v-btn>
        <v-btn v-for="item in cateList" :key="item.id" text color="white">{{item.name}}</v-btn>
      </v-container>

      <v-spacer></v-spacer>

      <v-responsive max-width="260" color="white">
        <v-text-field dense flat hide-details solo-inverted rounded dark></v-text-field>
      </v-responsive>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cateList: [],
    };
  },
  created() {
    this.GetCateList();
  },
  methods: {
    // 获取分类
    async GetCateList() {
      const { data: res } = await this.$http.get("category");
      this.cateList = res.data;
      console.log(res);
    },
  },
};
</script>

<style>
</style>