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

      <v-responsive max-width="260" class="mr-5" color="white">
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

      <v-dialog max-width="800">
        <template v-slot:activator="{ on, attrs }">
          <v-btn v-if="!headers.username" text dark v-bind="attrs" v-on="on">请登录</v-btn>

          <v-btn v-if="headers.username" text dark>欢迎你{{headers.username}}</v-btn>
          <v-btn v-if="headers.username" text dark @click="loginout">退出</v-btn>
        </template>

        <template v-slot:default="dialog">
          <v-card>
            <v-toolbar color="indigo darken-2" dark>请登录</v-toolbar>
            <v-card-text class="mt-5">
              <v-text-field v-model="formdata.username" placeholder="请输入用户名"></v-text-field>
              <v-text-field v-model="formdata.password" placeholder="请输入密码" type="password"></v-text-field>
            </v-card-text>
            <v-card-actions class="justify-end">
              <v-btn text @click="login">确定</v-btn>
              <v-btn text @click="dialog.value = false">取消</v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>

      <v-dialog max-width="800">
        <template v-slot:activator="{ on, attrs }">
          <v-btn v-if="!headers.username" text dark v-bind="attrs" v-on="on">注册</v-btn>
        </template>

        <template v-slot:default="dialog">
          <v-card>
            <v-toolbar color="indigo darken-2" dark>欢迎注册</v-toolbar>
            <v-card-text class="mt-5">
              <v-text-field v-model="formdata.username" placeholder="请输入用户名"></v-text-field>
              <v-text-field v-model="formdata.password" placeholder="请输入密码" type="password"></v-text-field>
            </v-card-text>
            <v-card-actions class="justify-end">
              <v-btn text @click="registerUser">确定</v-btn>
              <v-btn text @click="dialog.value = false">取消</v-btn>
            </v-card-actions>
          </v-card>
        </template>
      </v-dialog>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      cateList: [],
      searchName: '',
      formdata: {
        username: '',
        password: ''
      },
      dialog: false,
      headers: {
        Authorization: '',
        username: ''
      }
    }
  },
  created() {
    this.GetCateList()
  },
  mounted() {
    this.headers = {
      Authorization: `Bearer ${window.sessionStorage.getItem('token')}`,
      username: window.sessionStorage.getItem('username')
    }
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
    },
    // 登录
    async login() {
      const { data: res } = await this.$http.post('loginfront', this.formdata)
      if (res.status !== 200) return this.$message.error(res.message)
      window.sessionStorage.setItem('username', res.data)
      window.sessionStorage.setItem('user_id', res.id)
      this.$message.success('登录成功')
      this.$router.go('/')
    },
    // 退出
    loginout() {
      window.sessionStorage.clear('token')
      window.sessionStorage.clear('username')

      this.$router.go('/')
      this.$message.success('退出成功')
    },

    // 注册
    async registerUser() {
      const { data: res } = await this.$http.post('user/add', {
        username: this.formdata.username,
        password: this.formdata.password,
        role: 2
      })
      if (res.status !== 200) return this.$message.error(res.message)
      this.$message.success('注册成功')
      this.$router.go('/')
    }
  }
}
</script>

<style>
</style>