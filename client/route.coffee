angular.module 'designCrawler'
  .config [
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
      $urlRouterProvider.otherwise '/home'
      $stateProvider
        .state 'home',
          url: '/home',
          templateUrl: 'client/home/views/home.ng.html',
          controller: 'HomeCtrl',
          controllerAs: 'home'
      return
  ]
