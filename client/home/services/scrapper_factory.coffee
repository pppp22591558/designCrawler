angular.module 'designCrawler'
  .factory 'Scrapper', ['$meteor', ($meteor) ->
    dribble: () ->
      $meteor.call('getDribbleTest').then(
        (result) ->
          return result
      )
    awww: () ->
      $meteor.call('getAwwwardsTest').then(
        (result) ->
          return result
      )
    zcoolGUI: () ->
      $meteor.call('getZcoolGUITest').then(
        (result) ->
          return result
      )
    zcoolWeb: () ->
      $meteor.call('getZcoolWebTest').then(
        (result) ->
          return result
      )
    cssWinner: () ->
      $meteor.call('getCssWinner').then(
        (result) ->
          return result
      )
  ]
