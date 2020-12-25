import Vue from 'vue'
import VueRouter from 'vue-router'
const Login = () => import(/* webpackChunkName: "Login" */ '../views/Login.vue')
const Admin = () => import(/* webpackChunkName: "Admin" */ '../views/Admin.vue')

// 页面路由组件
const Index = () => import(/* webpackChunkName: "Index" */ '../components/admin/Index.vue')
const AddArt = () => import(/* webpackChunkName: "AddArt" */ '../components/article/AddArt.vue')
const ArtList = () => import(/* webpackChunkName: "ArtList" */ '../components/article/ArtList.vue')
const CateList = () => import(/* webpackChunkName: "CateList" */ '../components/category/CateList.vue')
const UserList = () => import(/* webpackChunkName: "UserList" */ '../components/user/UserList.vue')
const Profile = () => import(/* webpackChunkName: "UserList" */ '../components/user/Profile.vue')

// 路由重复点击捕获错误
const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location, onResolve, onReject) {
  if (onResolve || onReject) return originalPush.call(this, location, onResolve, onReject)
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'login',
    meta: {
      title: '请登录'
    },
    component: Login
  },
  {
    path: '/',
    name: 'admin',
    meta: {
      title: 'GinBlog 后台管理页面'
    },
    component: Admin,
    children: [
      { path: 'index', component: Index },
      { path: 'addart', component: AddArt },
      { path: 'addart/:id', component: AddArt, props: true },
      { path: 'artlist', component: ArtList },
      { path: 'catelist', component: CateList },
      { path: 'userlist', component: UserList },
      { path: 'profile', component: Profile }
    ]
  }
]

const router = new VueRouter({
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title
  }
  next()
  const token = window.sessionStorage.getItem('token')
  if (to.path === '/login') return next()
  if (!token) {
    next('/login')
  } else {
    next()
  }
})

export default router
