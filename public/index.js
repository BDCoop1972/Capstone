/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      times: []
    };
  },
  created: function() {
    axios.get("http://local:3000/jewishtimes").then(function(response) {this.times = response.data;}.bind(this));
  },
  methods: {},
  computed: {}
};
var router = new VueRouter({
  routes: [{ path: "/", component: HomePage }],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
