Meteor.startup( ()->
  ZcoolPics = new Mongo.Collection "zcoolPics"
  cheerio = Meteor.npmRequire('cheerio')
  xray = Meteor.npmRequire('x-ray')
  future = Npm.require('fibers/future')
  x = xray()
  Meteor.methods(
    getDribbleTest: () ->
      dribbble = new future()
      x('https://dribbble.com', 'li.group', [
        image: '.dribbble-img [data-src]@data-src'
        title: '.dribbble-img strong'
        link: 'a.dribbble-link@href'
        ]).paginate('.next_page@href')
          .limit(10)((err, obj) ->
            if err
              dribbble.throw(err)
              return
            dribbble.return(obj)
            return
          )
      dribbleImg = dribbble.wait()

    getAwwwardsTest: () ->
      awww = new future()
      x('http://www.awwwards.com/awards-of-the-day/', ' #content ul.list-item li', [
        image: 'a:first-child img@src'
        title: 'h3.bold a'
        link: 'h3.bold a@href'
        ]).paginate('a.next@href')
          .limit(10)((err, obj) ->
            if err
              awww.throw(err)
              return
            awww.return(obj)
            return
          )
      awwwImg = awww.wait()

    getZcoolGUITest: () ->
      zcoolg = new future()
      x('http://www.zcool.com.cn/works/17!0!!2!1!0!1!1!!!/', 'ul.layout li', [
        image: 'a:first-child img@src'
        title: 'a:first-child img@alt'
        link: '.camLiTitleC a@href'
        ]).paginate('.pageNext@href')
          .limit(10)((err, obj) ->
            if err
              zcoolg.throw(err)
              return
            zcoolg.return(obj)
            return
          )
      zcoolgImg = zcoolg.wait()

    getZcoolWebTest: () ->
      zcoolw = new future()
      x('http://www.zcool.com.cn/works/607!0!!2!1!0!1!1!!!/', 'ul.layout li', [
        image: 'a:first-child img@src'
        title: 'a:first-child img@alt'
        link: '.camLiTitleC a@href'
        ]).paginate('.pageNext@href')
          .limit(10)((err, obj) ->
            if err
              zcoolw.throw(err)
              return
            zcoolw.return(obj)
            return
          )
      zcoolwImg = zcoolw.wait()

    getCssWinner: (n) ->
      cssWinner = new future()
      x('http://www.csswinner.com/winners/1', '.winnerList .monWinner', [
        image: 'img@src'
        title: 'img@alt'
        link: 'h3 a@href'
        next: '.paging a.next@href'
        ]).paginate('.paging a.next@href')
          .limit(10)((err, obj) ->
            if err
              cssWinner.throw(err)
              return
            cssWinner.return(obj)
            return
          )
      cssWinnerImg = cssWinner.wait()

  )
  return
)
