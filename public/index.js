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
      var calendar = $('#calendar').fullCalendar('getCalendar');
      var view = calendar.view;
      var start = view.start._d;
      var end = view.end._d;
      var dates = { start: start, end: end };
//       (document).ready;
// $(function() {
//         $('#calendar').fullCalendar({
//           themeSystem: 'jquery-ui',
//           themeName: 'Mint Choc',
//           header: {
//             left: "",
//             center: "title"
//           },
//           editable: false,
//           fixedWeekCount: false,
//           timezone: false,
//           events: {
//             url: "http://localhost:3000/jewishtimes",
//             cache: true
//           }
//         });
//         ("body").keydown(function(e) {
//           if (e.keyCode === 37) {
//             ('#calendar').fullCalendar('prev');
//           } else if (e.keyCode === 39) {
//             ('#calendar').fullCalendar('next');
//           }
//         });
//       });

      // console.log;
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
  // mounted: function() {
  //   var calendar = $('#calendar').fullCalendar('getCalendar');
  //   var view = calendar.view;
  //   var start = view.start._d;
  //   var end = view.end._d;
  //   var dates = { start: start, end: end };
  //   var fullCalendar = {
  //     themeSystem: 'jquery-ui',
  //     themeName: 'Mint Choc',
  //     header: {
  //       left: "",
  //       center: "title"
  //     // right: "month,agendaWeek,agendaDay"
  //     },
  //     editable: false,
  //     fixedWeekCount: false,
  //     timezone: false,
  //     events: {
  //       url: "http://localhost:3000/jewishtimes",
  //       cache: true
  //     }
  //   };
  //   ("body").keydown(function(e) {
  //     if (e.keyCode === 37) {
  //       ('#calendar').fullCalendar('prev');
  //     } else if (e.keyCode === 39) {
  //       ('#calendar').fullCalendar('next');
  //     }
  //   });
  // },
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
