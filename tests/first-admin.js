var assert = require('assert');

suite('User', function() {
  test('should make the first signup an admin', function(done, server) {
    server.eval(function() {
      Accounts.createUser({email: 'joe@sixpack.com', password: 'abcd1234'});
      var users = Meteor.users.find().fetch();
      emit('users', users);
    });

    server.once('users', function(users) {
      assert.equal(users[0].admin, true);
      done();
    });
  });
  
  test('should not make the second signup an admin', function(done, server) {
    server.eval(function() {
      Accounts.createUser({email: 'admin@podcaster.com', password: 'abcd1234'});
      Accounts.createUser({email: 'joe@sixpack.com', password: 'abcd1234'});
      var users = Meteor.users.find().fetch();
      emit('users', users);
    });
    server.once('users', function(users) {
      assert.equal(users[1].admin, false);
      done();
    });
  }); 
});
