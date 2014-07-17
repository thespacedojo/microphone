var assert = require('assert');

suite('Episode', function() {
  test('an admin can add new episodes', function(done, server, client) {
    server.eval(function() {
      Episode.find().observe({
        added: function(episode) {
          emit('episode', episode);
        }
      });

    }).once('episode', function(episode) {
      assert.equal(episode.title, 'hello title');
      done();
    });

    client.evalSync(function() {
      Accounts.createUser({email: 'a@a.com', password: '123456'});
      Meteor.loginWithPassword('a@a.com', '123456', function() {
        assert.equals(Meteor.users.find().fetch().admin, true)
        Episode.create({title: 'hello title'});
      });
    });
  });

  test('a regular user should not be allowed to add new episodes', function(done, server, client) {
    client.evalSync(function() {
      Accounts.createUser({email: 'a@a.com', password: '123456'});
      Accounts.createUser({email: 'b@b.com', password: '123456'});
      Meteor.loginWithPassword('b@b.com', '123456', function() {
        Episode.create({title: 'hello title'});
        emit('done')
      });
    }).once('done', function() {
      assert.equals(Episode.find().fetch(), [])
      done();
    })
  });
});
