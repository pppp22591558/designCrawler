angular.module 'designCrawler'
  .factory 'Scrapper', ['$meteor', ($meteor) ->
    dribble: () ->
      $meteor.call('getDribbleTest').then(
        (result) ->
          return result
      )
    cnDesign: () ->
      $meteor.call('getCndesignTest').then(
        (result) ->
          return result
      )
    zcool: () ->
      $meteor.call('getZccolTest').then(
        (result) ->
          return result
      )
  ]
