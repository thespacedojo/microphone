Template.newPodcast.helpers
  file: ->
    name: 'newPodcast'
    current: Session.get 'create.details.podcastUrl'
    onUpload: (err, result) ->
      Session.set 'create.details.podcastUrl', result.url.replace /^http:/, ''
    onDelete: (err, result) ->
      Session.set 'create.details.podcastUrl', null

Template.newPodcast.events
  'submit form': (event) ->
    event.preventDefault()
    formData = SimpleForm.processForm(event.target)
    formData['url'] = Session.get 'create.details.podcastUrl'
    Episode.create(formData)
    Router.go('/admin')
