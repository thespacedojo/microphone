class @Episode extends Minimongoid
  @_collection: new Meteor.Collection('episodes')

  @before_create: (episode) ->
    episode.slug = Episode.slugify(episode.title)
    episode.downloadCount = 0
    episode

  @slugify: (str) ->
    str.toLowerCase().replace(/[^\w ]+/g, "").replace(RegExp(" +", "g"), "-")

@Episode._collection.allow
  insert: (userId, doc) ->
    userId

  update: (userId, doc, fields) ->
    userId

  remove: (userId, doc) ->
    userId
