#created by Amit on 5/5/14.
cart=[]
app = angular.module('myApp',['ui.router','jsonService'])
app.config ($stateProvider,$urlRouterProvider) ->
  $stateProvider
  .state('home', {
      url: "",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { controller:"productsCtrl", templateUrl: "home.html" }
      }
    })
  .state('index', {
      url: "/",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { controller:"productsCtrl", templateUrl: "home.html" }
      }
    })
  .state('product', {
      url: "/product/:id",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { controller:"productCtrl", templateUrl: "product.html" }
      }
    })
  .state('cart', {
      url: "/cart",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { controller:"cartCtrl", templateUrl: "cart.html" }
      }
    })
  .state('about', {
      url: "/about",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { templateUrl: "about.html" }
      }
    })
  .state('contact', {
      url: "/contact",
      views: {
        "viewA": { templateUrl: "header.html" },
        "viewB": { controller:"contactCtrl", templateUrl: "contact.html" }
      }
    })
  $urlRouterProvider.otherwise("/")
  return