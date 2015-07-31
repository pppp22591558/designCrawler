angular.module 'designCrawler'
  .controller 'HomeCtrl', [ '$meteor', 'Scrapper', '$rootScope', ($meteor, Scrapper, $rootScope) ->
    home = this
    home.itemList = []
    Scrapper.dribble().then((result) ->
      home.itemList.push(result)
      $rootScope.showSpinner = false
      home.loading = true
    )
    Scrapper.awww().then((result) ->
      home.itemList.push(result)
    )
    Scrapper.zcoolGUI().then((result) ->
      home.itemList.push(result)
    )
    Scrapper.zcoolWeb().then((result) ->
      home.itemList.push(result)
    )
    Scrapper.cssWinner().then((result) ->
      home.itemList.push(result)
      home.loading = false
    )
    return
  ]
