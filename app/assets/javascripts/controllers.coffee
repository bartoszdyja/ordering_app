app = angular.module('OrderingApp')

app.controller 'LoginCtrl', ($scope, $auth, $location) ->
  $scope.authenticate = (provider) ->
    $auth.authenticate provider
  $scope.logout = () ->
    $auth.logout()
    $location.path('/home')
  $scope.isAuthenticated = () ->
    $auth.isAuthenticated()

app.controller 'UserCtrl', ($scope, $auth, User) ->
  $scope.user = User.show()

app.controller 'NewOrderCtrl', ($scope, $resource, Order, $location) ->
  $scope.addOrder = ->
    Order.create { order: $scope.order }, (response)->
      $location.path('/order/'+response.id)
      console.log response
    , (error) ->
      console.log error

app.controller 'OrderCtrl', ($scope, $stateParams, Order) ->
  $scope.order = Order.show({id: $stateParams.orderId})
