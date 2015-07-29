angular.module 'designCrawler'
  .directive 'graphicList', ->
    restrict: 'E',
    templateUrl: 'client/home/views/graphic_list.ng.html',
    scope:
      item: '='
    ,
    link: (scope, elem, attrs) ->
