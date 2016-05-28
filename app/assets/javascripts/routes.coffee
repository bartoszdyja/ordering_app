angular.module('OrderingApp').config ($stateProvider, $urlRouterProvider) ->
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
