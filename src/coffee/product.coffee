#created by Amit on 5/5/14.
app.controller 'productCtrl', ($scope,jsonDataService,$stateParams,$window)->
  $scope.product={}
  $scope.available=[]
  jsonDataService.get (data)->
    _.each data, (d)->
      if d.productID== $stateParams.id
        $scope.product=d
        [1..d.available].map (i) ->
          $scope.available.push(i)
    return
  $scope.Buy=() ->
    item={
      orderid:cart.length
      productID:$stateParams.id
      Quantity:$scope.quantity
      productName:$scope.product.productName
      Price:$scope.product.price
    }
    cart.push(item)
    console.log cart
    $window.location='#/cart'
  return

