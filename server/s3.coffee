Meteor.call "S3config",
  key: 'AKIAI44G3J23BTPHQPDA',
  secret: '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',
  bucket: 'microscope-demo',

Meteor.methods
  callbackFunction: (url,context)->
    console.log('Add '+url+' to the id of '+context)
