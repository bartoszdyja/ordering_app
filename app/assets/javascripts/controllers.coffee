angular.module('OrderingApp').controller 'LoginCtrl', ($scope, $auth) ->
  $scope.authenticate = (provider) ->
    $auth.authenticate provider
  $scope.logout = () ->
    $auth.logout()
  $scope.isAuthenticated = () ->
    $auth.isAuthenticated()
  console.log $auth.isAuthenticated()
