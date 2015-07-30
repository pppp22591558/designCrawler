angular.module 'designCrawler'
  .controller 'HomeCtrl', [ '$meteor', 'dribblePics', 'cnDesinArticles', ($meteor, dribblePics, cnDesinArticles) ->
    home = this
    home.itemList = dribblePics
    home.articleList = cnDesinArticles
    return
  ]
