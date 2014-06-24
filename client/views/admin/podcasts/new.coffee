Template.episodeForm.helpers
  file: ->
    name: 'newPodcast'
    onUpload: (err, result) ->
      Session.set 'create.details.podcastUrl', result.url.replace /^http:/, ''

  fileUploaded: ->
    Session.get 'create.details.podcastUrl'

Template.episodeForm.events
  'submit form': (event) ->
    event.preventDefault()
    formData = SimpleForm.processForm(event.target)
    formData['url'] = Session.get 'create.details.podcastUrl'
    Session.set 'create.details.podcastUrl', null
    if Session.get('episodeSlug')
      episode = Episode.first({slug: Session.get('episodeSlug')})
      episode.update(formData)
      Session.set 'episodeSlug', undefined
    else
      Episode.create(formData)
    Router.go('/admin')
