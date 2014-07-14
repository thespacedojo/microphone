Meteor.publish 'publishedEpisodes', ->
  Episode.find({}, {sort: {createdAt: -1}})

Meteor.publish 'allEpisodes', ->
  Episode.find({})

Meteor.publish 'episode', (slug) ->
  Episode.find({slug: slug})
