<template>
  <div>
    <v-app-bar app color="indigo darken-2">
      <v-avatar class="mx-12" size="40" color="grey">
        <img src="../assets/logo.png" alt />
      </v-avatar>
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
            <v-form ref="loginFormRef" v-model="valid">
              <v-card-text class="mt-5">
                <v-text-field
                  v-model="formdata.username"
                  hint="至少4个字符"
                  counter="12"
                  :rules="nameRules"
                  label="请输入用户名"
                ></v-text-field>
                <v-text-field
                  v-model="formdata.password"
                  hint="至少6个字符"
                  counter="20"
                  :rules="passwordRules"
                  label="请输入密码"
                  type="password"
                ></v-text-field>
              </v-card-text>
              <v-card-actions class="justify-end">
                <v-btn text @click="login">确定</v-btn>
                <v-btn text @click="dialog.value = false">取消</v-btn>
              </v-card-actions>
            </v-form>
          </v-card>
        </template>
      </v-dialog>

      <v-dialog max-width="800">
        <template v-slot:activator="{ on, attrs }">
          <v-btn v-if="!headers.username" text dark v-bind="attrs" v-on="on">注册</v-btn>
        </template>
        <template v-slot:default="dialog">
          <v-form ref="registerformRef" v-model="registerformvalid">
            <v-card>
              <v-toolbar color="indigo darken-2" dark>欢迎注册</v-toolbar>
              <v-card-text class="mt-5">
                <v-text-field
                  v-model="formdata.username"
                  hint="至少4个字符"
                  counter="12"
                  :rules="nameRules"
                  label="请输入用户名"
                ></v-text-field>
                <v-text-field
                  v-model="formdata.password"
                  :rules="passwordRules"
                  hint="至少6个字符"
                  counter="20"
                  label="请输入密码"
                  type="password"
                ></v-text-field>
                <v-text-field
                  v-model="checkPassword"
                  :rules="checkPasswordRules"
                  hint="至少6个字符"
                  counter="20"
                  label="请确认密码"
                  type="password"
                ></v-text-field>
              </v-card-text>
              <v-card-actions class="justify-end">
                <v-btn text @click="registerUser">确定</v-btn>
                <v-btn text @click="dialog.value = false">取消</v-btn>
              </v-card-actions>
            </v-card>
          </v-form>
        </template>
      </v-dialog>
    </v-app-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      valid: true,
      registerformvalid: true,
      cateList: [],
      searchName: '',
      formdata: {
        username: '',
        password: ''
      },
      checkPassword: '',
      dialog: false,
      headers: {
        Authorization: '',
        username: ''
      },
      nameRules: [
        (v) => !!v || '用户名不能为空',
        (v) =>
          (v && v.length >= 4 && v.length <= 12) ||
          '用户名必须在4到12个字符之间'
      ],
      passwordRules: [
        (v) => !!v || '密码不能为空',
        (v) =>
          (v && v.length >= 6 && v.length <= 20) || '密码必须在6到20个字符之间'
      ],
      checkPasswordRules: [
        (v) => !!v || '密码不能为空',
        (v) =>
          (v && v.length >= 6 && v.length <= 20) || '密码必须在6到20个字符之间',
        (v) => v === this.formdata.password || '密码两次输入不一致，请检查'
      ]
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
      if (!this.$refs.loginFormRef.validate())
        return this.$message.error('输入数据非法，请检查输入的用户名和密码')
      const { data: res } = await this.$http.post('loginfront', this.formdata)
      if (res.status !== 200) return this.$message.error(res.message)
      window.sessionStorage.setItem('username', res.data)
      window.sessionStorage.setItem('user_id', res.id)
      this.$message.success('登录成功')
      this.$router.go(0)
    },

    // 退出
    loginout() {
      window.sessionStorage.clear('token')
      window.sessionStorage.clear('username')
      this.$message.success('退出成功')
      this.$router.go(0)
    },

    // 注册
    async registerUser() {
      if (!this.$refs.registerformRef.validate())
        return this.$message.error('输入数据非法，请检查输入的用户名和密码')
      const { data: res } = await this.$http.post('user/add', {
        username: this.formdata.username,
        password: this.formdata.password,
        role: 2
      })
      if (res.status !== 200) return this.$message.error(res.message)
      this.$message.success('注册成功')
      this.$router.go(0)
    }
  }
}
</script>

<style>
</style>