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
    Meteor.call "S3upload",fileData,context,callbackFunction, (err, url) ->
      if err
        console.log "Oops #{err}"
      else
        formData['url'] = url
        Episode.create(formData)
        Router.go('/admin/dashboard')
