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
    , (error) ->
      console.log error

app.controller 'OrdersCtrl', ($scope, Order) ->
  $scope.orders = Order.index()

app.controller 'OrderCtrl', ($scope, $stateParams, $location, Order, Meal) ->
  $scope.order = Order.show({id: $stateParams.orderId})
  console.log($scope.order)
  $scope.updateOrder = ->
    Order.update {id:$stateParams.orderId}, (response)->
      $scope.order = Order.show({id: $stateParams.orderId})
    , (error) ->
      console.log error
  $scope.orderFinished = ->
    $scope.order.status == 'delivered'
  $scope.addMeal = ->
    console.log($scope.order.id)
    $scope.meal.order_id = $scope.order.id
    Meal.create { meal: $scope.meal }, (response)->
      $scope.order = Order.show({id: $stateParams.orderId})
      console.log($scope.order)
    , (error) ->
      console.log error
