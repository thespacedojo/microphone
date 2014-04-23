AdminController = RouteController.extend
  yieldTemplates:
    header:
      to: 'header'
  onBeforeAction: ->
    AccountsEntry.signInRequired(@)

Router.map ->
  @route 'home',
    path: '/'
    data: ->
      episodes: Episode.all()

  @route 'dashboard',
    path: '/dashboard'

  @route 'newPodcast',
    path: '/admin/podcasts/new'
    data: ->
      new Episode

  if Meteor.isServer
    @route 'rss',
      where: 'server'
      path: '/rss/episodes'
      action: ->
        @response.write Meteor.call 'serveRSS'
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
