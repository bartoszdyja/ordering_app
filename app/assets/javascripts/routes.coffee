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
  $stateProvider.state('new_order', {
    url: '/new_order',
    controller: 'NewOrderCtrl',
    templateUrl: 'new_order.html'
  })
  $stateProvider.state('order', {
    url: '/order/:orderId',
    controller: 'OrderCtrl',
    templateUrl: 'order.html'
  })
  $stateProvider.state('orders', {
    url: '/orders',
    controller: 'OrdersCtrl',
    templateUrl: 'orders.html'
  })
