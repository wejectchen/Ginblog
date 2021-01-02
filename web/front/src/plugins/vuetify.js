import Vue from 'vue'
import Vuetify from 'vuetify/lib/framework'
import Message from 'vue-multiple-message'

Vue.prototype.$message = Message

Vue.use(Vuetify)

export default new Vuetify({})
