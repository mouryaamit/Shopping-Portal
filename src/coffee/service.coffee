#created by Amit on 5/5/14.
angular.module 'jsonService', ['ngResource']
.factory 'jsonDataService', ($resource) ->
  $resource 'data.json',{ },{get: {method:'GET',isArray: true}}
