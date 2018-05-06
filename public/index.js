/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      times: [],
      dates: [],
      zipcode: "",
      zipcodeDate: "",
      date: ""
    };
  },
  created: function() {},
  methods: {
    submit: function() {
      var params = {
        zip: this.zipcode
      };
      axios.get('/jewishtimes?zip=' + params.zip).then(function(response) { 
        router.push("/");
        this.times = response.data;
      }.bind(this))
        .catch(function(error) {
          this.errors = error.response.data.errors;
        }.bind(this));
    },
    submitDate: function() {
      var params = {
        zip: this.zipcode,
        date: this.date
      };
      axios.get('/jewishtimes?zip=' + params.zip + '&date=' + params.date).then(function(response) { 
        router.push("/");
        this.dates = response.data;
      }.bind(this))
        .catch(function(error) {
          this.errors = error.response.data.errors;
        }.bind(this));
    }
  },
  computed: {}
};


var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});
