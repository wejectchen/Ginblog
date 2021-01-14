import Vue from 'vue'
import axios from 'axios'

axios.defaults.baseURL = 'http://47.108.116.119:3000/api/v1'
Vue.prototype.$http = axios
