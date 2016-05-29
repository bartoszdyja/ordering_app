app = angular.module('OrderingApp')

app.config ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise('/');

  $stateProvider.state('home', {
    url: '/',
    templateUrl: 'index.html'
  })
  $stateProvider.state('login', {
    url: '/login',
    controller: 'LoginCtrl',
    templateUrl: 'login.html'
  })
  $stateProvider.state('user', {
    url: '/user',
    controller: 'UserCtrl',
    templateUrl: 'profile.html'
  })
