/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:

import TurbolinksAdapter from "vue-turbolinks";
import Vue from "vue/dist/vue.esm";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import App from "../app.vue";
import SignInForm from "../SignInForm.vue";
import SignUpForm from "../SignUpForm.vue";
import cards from "../cards.vue";
import add_card from "../add_card.vue";
import app from "../app.vue";
import axios from "axios";

// Vue.use(VueAxios, axios);
Vue.use(TurbolinksAdapter);
Vue.use(ElementUI);

// my custom components
Vue.component("sign-in", SignInForm);
Vue.component("sign-up", SignUpForm);
Vue.component("cards", cards);
Vue.component("add-card", add_card);
Vue.component("app", app);


document.addEventListener("turbolinks:load", () => {
  const app = new Vue({
    el: "#app",
    data: () => {
      return {
        visible: false,
        editProject: false,
        destroyProject: false
      };
    },
    methods: {
      async _destroyProject(path, to) {
        try {
          const response = await axios.delete(path);
          console.log(response);

          window.location.href = to;
        } catch (error) {
          console.log(error);
        }
      }
    },
    components: { App }
  });
});
