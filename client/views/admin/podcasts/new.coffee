Template.newPodcast.helpers
  file: ->
    name: 'newPodcast'
    onUpload: (err, result) ->
      Session.set 'create.details.podcastUrl', result.url.replace /^http:/, ''

  fileUploaded: ->
    Session.get 'create.details.podcastUrl'

Template.newPodcast.events
  'submit form': (event) ->
    event.preventDefault()
    formData = SimpleForm.processForm(event.target)
    formData['url'] = Session.get 'create.details.podcastUrl'
    Session.set 'create.details.podcastUrl', null
    Episode.create(formData)
    Router.go('/admin')
