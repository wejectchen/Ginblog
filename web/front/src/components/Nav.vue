<template>
  <v-card class="mx-auto" max-width="320">
    <v-img :src="profileInfo.img">
      <v-card-title>
        <v-col align="center">
          <v-avatar size="130" color="grey">
            <img :src="profileInfo.avatar" alt />
          </v-avatar>
          <div class="ma-4 white--text">{{profileInfo.name}}</div>
        </v-col>
      </v-card-title>
      <v-divider></v-divider>
    </v-img>

    <v-card-title>About Me:</v-card-title>
    <v-card-text>{{profileInfo.desc}}</v-card-text>

    <v-divider color="indigo"></v-divider>

    <v-list nav dense>
      <v-list-item>
        <v-list-item-icon class="ma-3">
          <v-icon color="blue darken-2">{{'mdi-qqchat'}}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="grey--text">{{profileInfo.qq_chat}}</v-list-item-content>
      </v-list-item>

      <v-list-item>
        <v-list-item-icon class="ma-3">
          <v-icon color="green darken-2">{{'mdi-wechat'}}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="grey--text">{{profileInfo.wechat}}</v-list-item-content>
      </v-list-item>

      <v-list-item>
        <v-list-item-icon class="ma-3">
          <v-icon color="orange darken-2">{{'mdi-sina-weibo'}}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="grey--text">{{profileInfo.weibo}}</v-list-item-content>
      </v-list-item>

      <v-list-item>
        <v-list-item-icon class="ma-3">
          <v-icon color="primary">{{"mdi-youtube"}}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="grey--text">{{profileInfo.bili}}</v-list-item-content>
      </v-list-item>

      <v-list-item>
        <v-list-item-icon class="ma-3">
          <v-icon color="indigo">{{'mdi-email'}}</v-icon>
        </v-list-item-icon>
        <v-list-item-content class="grey--text">{{profileInfo.email}}</v-list-item-content>
      </v-list-item>
    </v-list>
  </v-card>
</template>
<script>
export default {
  data() {
    return {
      profileInfo: {
        id: 1
      }
    }
  },
  created() {
    this.getProfileInfo()
  },
  methods: {
    // 获取个人设置
    async getProfileInfo() {
      const { data: res } = await this.$http.get(
        `profile/${this.profileInfo.id}`
      )
      this.profileInfo = res.data
      this.$root.$emit('msg', res.data.icp_record)
    }
  }
}
</script>
<style>
</style>