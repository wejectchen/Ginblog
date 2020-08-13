<template>
  <a-layout class="container">
    <a-layout-sider>
      <div class="log">
        <span>My Blog</span>
      </div>
      <Nav></Nav>
    </a-layout-sider>
    <a-layout>
      <a-layout-header class="headerBtn">
        <a-button type="danger" @click="loginOut">退出</a-button>
      </a-layout-header>
      <a-layout-content>
        <router-view></router-view>
      </a-layout-content>
      <a-layout-footer>
        <Footer></Footer>
      </a-layout-footer>
    </a-layout>
  </a-layout>
</template>

<script>
import Nav from '../components/admin/Nav'
import Footer from '../components/admin/Footer'
export default {
  components: { Nav, Footer },
  methods: {
    loginOut() {
      window.sessionStorage.clear('token')
      this.$router.push('/login')
    }
  }
}
</script>

<style scoped>
.container {
  height: 100%;
}
.headerBtn {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.log {
  height: 32px;
  margin: 16px;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 17px;
}
</style>
