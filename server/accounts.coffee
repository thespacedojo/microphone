Meteor.startup ->
  AccountsEntry.config
    signupCode: null

Accounts.onCreateUser (options, user) ->
  if Meteor.users.find().count() is 0
    user.admin = true
  else
    user.admin = false
  user
