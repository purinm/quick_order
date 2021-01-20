import Vue from 'vue';
import { Menu } from 'ant-design-vue';
import App from '../menu.vue'
Vue.use(Menu);
import 'ant-design-vue/dist/antd.css';


document.addEventListener('DOMContentLoaded', () => {
  const menu = new Vue({
    render: h => h(App)
  }).$mount()
  document.body.prepend(menu.$el)
})