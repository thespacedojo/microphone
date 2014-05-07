Meteor.methods

  serveRSS: () ->
    RSS = Meteor.require('rss')
    host = _.trim Meteor.absoluteUrl(), '/'

    feed = new RSS
      title: "Microphone"
      description: "A podcasting website"
      feed_url: host + '/rss/episodes'
      site_url: host
      image_url: host + '/favicon.ico'

    posts = Episode.all()

    posts.forEach (post) ->
      feed.item
       title: post.title
       description: post.body
       author: "Microphone Poster"
       date: post.createdAt
       url: "#{host}/#{post._id}"
       guid: post._id
       enclosure: {url: "#{host}/download/#{post.slug}"}

    return feed.xml()
