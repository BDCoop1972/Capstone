/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Jewish Times!",
      times: [],
      zipcode: ""
    };
  },
  created: function() {
    // axios.get('/jewishtimes').then(function(response) {this.times = response.data;}.bind(this));
  },
  methods: {
    submit: function() {
        var params = {
            zip: this.zipcode
        };
        axios.get('/jewishtimes?zip=' + params.zip).then(function(response) { 
            router.push("/");
            // console.log(response.data.);
            this.times = response.data;
        }.bind(this))
        .catch(function(error) {this.errors = error.response.data.errors;}.bind(this));
    }
  },
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
