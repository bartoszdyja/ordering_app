app = angular.module('OrderingApp', ['ui.router', 'templates', 'satellizer', 'ngResource'])

app.config ($authProvider, $httpProvider) ->
  $authProvider.facebook clientId: '792920127488625'
  $authProvider.github clientId: '01c5fc0173c5b13fb1f2'
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    angular.element(document.querySelector('meta[name=csrf-token]')).attr('content')

app.factory 'User', ($resource) ->
  $resource '/api/user', {},
    'show':
      method: 'GET'
      isArray: false

app.factory 'Order', ($resource) ->
  $resource '/api/orders/:id', { id: '@id' },
    'create':
      method: 'POST'
    'show':
      method: 'GET'
      isArray: false
