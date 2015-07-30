Meteor.startup( ()->
  ZcoolPics = new Mongo.Collection "zcoolPics"
  cheerio = Meteor.npmRequire('cheerio')
  xray = Meteor.npmRequire('x-ray')
  future = Npm.require('fibers/future')
  x = xray()
  Meteor.methods(
    ###
    getZcoolTest: () ->
      result = Meteor.http.get("http://www.zcool.com.cn/works/17!0!!0!0!200!1!1!!!/")
      $ = cheerio.load(result.content)
      imgSrc = []
      $('ul > li > a > img').each( (i, elem) ->
        imgSrc[i] = $(this).attr('src')
        return
      )
      imgSrc.join ', '
      return imgSrc
      ###
    getDribbleTest: () ->
      dribbble = new future()
      x('https://dribbble.com', 'li.group', [
        image: '.dribbble-img [data-src]@data-src'
        ]).paginate('.next_page@href')
          .limit(5)((err, obj) ->
            if err
              dribbble.throw(err)
              return
            dribbble.return(obj)
            return
          )
      dribbleImg = dribbble.wait()

    getCndesignTest: () ->
      cn = new future()
      x('http://www.cndesign.com/list_11.html', '.list_detail', [
        title: '.list_title a',
        link: '.list_title a@href'
        ]).paginate('bigPage.vm a@href')
          .limit(5)((err, obj) ->
            if err
              cn.throw(err)
              return
            cn.return(obj)
            return
          )
      cndesign = cn.wait()

    getZccolTest: () ->
      zcool = new future()
      x('http://www.zcool.com.cn/works/17!0!!0!0!200!1!1!!!/', 'ul li', [
        image: 'img@src'
        ]).paginate('.pageNext')
          .limit(5)((err, obj) ->
            if error
              zcool.throw(err)
              return
            zcool.return(obj)
            return
          )
      z = zcool.wait()
  )
  return
)
