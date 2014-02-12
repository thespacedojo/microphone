AdminController = RouteController.extend
  yieldTemplates:
    header:
      to: 'header'
  before: ->
    unless Meteor.user()
      @redirect('/sign-in')
      @stop()

Router.map ->
  @route 'home',
    path: '/'
    data: ->
      episodes: Episode.all()

  @route 'dashboard',
    path: '/dashboard'

  @route 'newPodcast',
    path: '/admin/podcasts/new'
    controller: AdminController
    data: ->
      new Episode

  @route 'notFound',
    path: '*'
    where: 'server'
    action: ->
      @response.statusCode = 404
      @response.end Handlebars.templates['404']()
