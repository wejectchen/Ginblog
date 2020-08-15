import Vue from 'vue'
import {
  ConfigProvider,
  Button,
  FormModel,
  Input,
  Icon,
  message,
  Layout,
  Menu,
<<<<<<< HEAD
  Row,
  Col,
  Table,
  Card,
  Pagination
=======
  Card,
  Table,
  Row,
  Col,
  ConfigProvider
>>>>>>> webdevl
} from 'ant-design-vue'

message.config({
  top: `60px`,
  duration: 2,
  maxCount: 3
})

Vue.prototype.$message = message

Vue.use(Button)
Vue.use(FormModel)
Vue.use(Input)
Vue.use(Icon)
Vue.use(Layout)
Vue.use(Menu)
<<<<<<< HEAD
Vue.use(Row)
Vue.use(Col)
Vue.use(Table)
Vue.use(Card)
Vue.use(Pagination)
=======
Vue.use(Card)
Vue.use(Table)
Vue.use(Row)
Vue.use(Col)
>>>>>>> webdevl
Vue.use(ConfigProvider)
