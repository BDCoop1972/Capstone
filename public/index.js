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
      $('#calendar').fullCalendar({
        themeSystem: 'jquery-ui',
        themeName: 'Mint Choc',
        header: {
          left: "",
          center: "title"
        },
        editable: false,
        fixedWeekCount: false,
        timezone: false,
        events: {
          url: ("http://localhost:3000/jewishtimes?zip=" + params.zip)
          // cache: true
        },
      });
      $(window).keydown(function(e) {
        if (e.keyCode === 37) {
          ('#calendar').fullCalendar('prev');
        } else if (e.keyCode === 39) {
          ('#calendar').fullCalendar('next');
        }
      });
      this.zipcode = ""; 
    },
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
  router: router,
  watch: {
    '$route': function() {
      window.location.reload();
      console.log("good afternoon");
    }
  }
});
