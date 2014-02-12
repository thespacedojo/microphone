Template.newPodcast.helpers

Template.newPodcast.events
  'submit form': (event) ->
    event.preventDefault()
    formData = SimpleForm.processForm(event.target)
    Episode.create(formData)
    Router.go('/admin/dashboard')
