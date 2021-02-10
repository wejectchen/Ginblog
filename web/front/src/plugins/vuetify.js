import Vue from 'vue'
import Vuetify from 'vuetify/lib/framework'
import Message from 'vue-multiple-message'

Message.config({
  top: 60,
  duration: 3000,
  zIndex: 2000
})
Vue.prototype.$message = Message

Vue.use(Vuetify)

export default new Vuetify({
  breakpoint: {
    mobileBreakpoint: 'sm' // 等于960
  }
})
