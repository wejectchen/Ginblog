import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import ArticleList from '../components/ArticleList.vue'
import Detail from '../components/Details.vue'
import Category from '../components/CateList.vue'
import Search from '../components/Search.vue'

Vue.use(VueRouter)

//获取原型对象上的push函数
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}

const routes = [
  {
    path: '/',
    component: Home,
    meta: { title: '欢迎来到GinBlog' },
    children: [
      { path: '/', component: ArticleList, meta: { title: '欢迎来到GinBlog' } },
      {
        path: 'detail/:id',
        component: Detail,
        meta: { title: '文章详情' },
        props: true
      },
      {
        path: 'category/:cid',
        component: Category,
        meta: { title: '分类信息' },
        props: true
      },
      {
        path: 'search/:title',
        component: Search,
        meta: { title: '搜索结果' },
        props: true
      }
    ]
  }
]

const router = new VueRouter({
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  if (to.meta.title) {
    document.title = to.meta.title ? to.meta.title : '加载中'
  }
  next()
})

export default router
