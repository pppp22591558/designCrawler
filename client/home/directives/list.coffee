angular.module 'designCrawler'
  .directive 'graphicList', ->
    restrict: 'E'
    templateUrl: 'client/home/views/graphic_list.ng.html'
    scope:
      items: '='
  .directive 'articleList', ->
    restrict: 'E'
    templateUrl: 'client/home/views/article_list.ng.html'
    scope:
      articles: '='
  .directive 'hoverShine', ->
    restrict: 'A'
    link: (scope, elem) ->
      $(elem).hover () ->
        $(this).toggleClass('shine')
        return
      return
  .directive 'picsSource', ->
    restrict: 'E'
    templateUrl: 'client/home/views/pics_sources.ng.html'
    scope:
      source: '='
