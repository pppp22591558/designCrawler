angular.module 'designCrawler'
  .config [
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
      $locationProvider.html5Mode(true)
      $stateProvider
        .state 'home',
          url: '/'
          templateUrl: 'client/home/views/home.ng.html'
          controller: 'HomeCtrl'
          controllerAs: 'home'
        .state 'test',
          url: '/test'
          templateUrl: 'client/test/views/test.ng.html'
          controller: 'TestCtrl'
          controllerAs: 'test'
        .state 'otherwise',
          url: '*path'
          template: ''
          controller: ['$state', ($state) ->
            $state.go('test')
          ]
      return
  ]
  .run [ '$rootScope', ($rootScope) ->
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      $rootScope.showSpinner = true
      return
  ]
