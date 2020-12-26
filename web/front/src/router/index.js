import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import ArticleList from '../components/ArticleList.vue'
import Detail from '../components/Details.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    component: Home,
    meta: { title: '欢迎来到GinBlog' },
    children: [
      { path: '/', component: ArticleList, meta: { title: '欢迎来到GinBlog' } },
      {
        path: '/detail/:id',
        component: Detail,
        meta: { title: '文章详情' },
        props: true
      }
    ]
  }
]

const router = new VueRouter({
  mode: 'history',
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
