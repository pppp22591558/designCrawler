angular.module 'designCrawler'
  .config [
    '$stateProvider', '$urlRouterProvider', '$locationProvider',
    ($stateProvider, $urlRouterProvider, $locationProvider) ->
      $locationProvider.html5Mode(true)
      $stateProvider
        .state 'otherwise',
          url: '*path'
          template: ''
          controller: ['$state', ($state) ->
            $state.go('home')
          ]
        .state 'home',
          url: '/'
          templateUrl: 'client/home/views/home.ng.html'
          controller: 'HomeCtrl'
          controllerAs: 'home'
          resolve:
            dribblePics: ($meteor) ->
              $meteor.call('getDribbleTest').then(
                (result) ->
                  return result
              )
            cnDesinArticles: ($meteor) ->
              $meteor.call('getCndesignTest').then(
                (result) ->
                  return result
              )
      return
  ]
  .run [ '$rootScope', ($rootScope) ->
    $rootScope.$on '$stateChangeStart', (event, toState, toParams, fromState, fromParams) ->
      if toState.resolve
        $rootScope.showSpinner = true
        console.log 'loading...'
      return

    $rootScope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
      if toState.resolve
        $rootScope.showSpinner = false
        console.log 'finished'
      return
    return
  ]
