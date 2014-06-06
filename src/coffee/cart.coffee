#created by Amit on 5/5/14.
app.controller 'cartCtrl', ($scope,jsonDataService,$window,$state)->
  $scope.cart=[]
  $scope.Total=0
  $scope.error=false
  if cart.length==0
    $scope.error=true
  _.each cart, (c)->
    c.subTotal=parseInt(c.Price)*parseInt(c.Quantity)
    $scope.Total+=c.subTotal
    $scope.cart.push(c)
  $scope.Remove = (prod) ->
    _.each cart, (c)->
      if c.orderid==prod.product.orderid
        cart.splice(cart.indexOf(prod.product), 1)
        $state.go('cart', {}, { reload: true });
  $scope.checkout = ()->
    $window.alert('Order Placed. Total Amount Rs.'+$scope.Total);
