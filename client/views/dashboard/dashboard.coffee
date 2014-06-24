Template.dashboard.helpers
  episodes: ->
    Episode.all().toArray()

  settings: ->
    fields: [
      {
        key: 'title'
        label: 'Title'
      },
      {
        key: 'url'
        label: 'URL'
        fn: (value, obj) ->
          new Spacebars.SafeString "<a href=\"#{value}\">Listen</a>"
      },
      {
        key: 'createdAt'
        label: 'Created At'
      },
      {
        key: 'id'
        label: 'Edit'
        fn: (value, obj) ->
          new Spacebars.SafeString "<a href=\"" + Router.path('episodeForm', { slug: obj.slug }) + "\"><i class=\"fa fa-pencil\"></i></a>"
      },
    ]
