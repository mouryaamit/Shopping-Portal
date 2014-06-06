#created by Amit on 5/5/14.
app.controller 'productsCtrl', ($rootScope, $scope,jsonDataService)->
  jsonDataService.get (data)->
    $scope.products = data
    return
  return
