@AdminController = RouteController.extend
  yieldTemplates:
    header:
      to: 'header'
  onBeforeAction: ->
    AccountsEntry.signInRequired(@, @pause)

Router.map ->
  @route 'home',
    path: '/'
    waitOn: ->
      Meteor.subscribe 'publishedEpisodes'
    data: ->
      episodes: Episode.all()

  @route 'episode',
    path: '/episode/:slug'
    waitOn: ->
      Meteor.subscribe 'episode', @params.slug
    data: ->
      Episode.first({slug: @params.slug})

  @route 'dashboard',
    path: '/admin'
    waitOn: ->
      Meteor.subscribe 'allEpisodes'
    data: ->
      episodes: Episode.all()
    controller: 'AdminController'

  @route 'episodeForm',
    path: '/admin/episodes/new'
    data: ->
      new Episode
    controller: 'AdminController'

  @route 'episodeForm',
    path: '/admin/episodes/:slug'
    waitOn: ->
      Meteor.subscribe 'episode', @params.slug
    data: ->
      Episode.first({slug: @params.slug})
    onBeforeAction: ->
      Session.set 'episodeSlug', @params.slug
    controller: 'AdminController'

  if Meteor.isServer
    @route 'rss',
      where: 'server'
      path: '/rss'
      action: ->
        @response.write Meteor.call 'serveRSS'
        @response.end()

  @route 'download',
    where: 'server'
    path: '/download/:slug'
    action: ->
      episode = Episode.first({slug: @params.slug})
      episode.update({downloadCount: episode.downloadCount + 1})
      @response.writeHead '302', {Location: episode.url}
      @response.end()

  @route 'tests',
    path: '/tests'
    layoutTemplate: 'tests'

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()
