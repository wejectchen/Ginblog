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
  Row,
  Col,
  Table,
  Card,
  Pagination,
  Modal,
  Select,
  Switch,
  Upload
} from 'ant-design-vue'

message.config({
  top: `60px`,
  duration: 2,
  maxCount: 3
})

Vue.prototype.$message = message
Vue.prototype.$confirm = Modal.confirm

Vue.use(Button)
Vue.use(FormModel)
Vue.use(Input)
Vue.use(Icon)
Vue.use(Layout)
Vue.use(Menu)
Vue.use(Row)
Vue.use(Col)
Vue.use(Table)
Vue.use(Card)
Vue.use(Pagination)
Vue.use(ConfigProvider)
Vue.use(Modal)
Vue.use(Select)
Vue.use(Switch)
Vue.use(Upload)
