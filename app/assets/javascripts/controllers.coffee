app = angular.module('OrderingApp')

app.controller 'LoginCtrl', ($scope, $auth, $location) ->
  $scope.authenticate = (provider) ->
    $auth.authenticate provider
  $scope.logout = () ->
    $auth.logout()
    $location.path('/home')
  $scope.isAuthenticated = () ->
    $auth.isAuthenticated()
  console.log $auth.isAuthenticated()

app.controller 'UserCtrl', ($scope, $auth, User) ->
  $scope.user = User.show()
