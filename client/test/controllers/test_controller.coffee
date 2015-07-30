angular.module 'designCrawler'
  .controller 'TestCtrl', ['$meteor', ($meteor) ->
    test = this
    test.title = 'hello world!'
    test.start = () ->
      $meteor.call('getCndesignTest').then (result)->
        test.articles = result
        return
      return
    return
  ]
