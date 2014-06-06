#created by Amit on 5/5/14.
app.controller 'contactCtrl', ($scope,$window)->
  $scope.send = () ->
    $window.alert('Message Sent Successfully');
    $window.location='#/'

