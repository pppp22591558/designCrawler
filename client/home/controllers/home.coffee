angular.module 'designCrawler'
  .controller 'HomeCtrl', [ '$meteor', 'Scrapper', '$rootScope', ($meteor, Scrapper, $rootScope) ->
    home = this
    Scrapper.dribble().then((result) ->
      home.itemList = result
      $rootScope.showSpinner = false
    )
    Scrapper.cnDesign().then((result) ->
      home.articleList = result
      $rootScope.showSpinner = false
    )
    return
  ]
