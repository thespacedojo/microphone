var assert = require('assert');

suite('Posts', function() {
  test('should use slugify', function(done, server) {
    server.eval(function() {
      Episode.create({title: 'Episode 15 - Google Ventures'});
      episode = Episode.first();
      emit('episode', episode);
    });

    server.once('episode', function(episode) {
      assert.equal(episode.slug, 'episode-15-google-ventures');
      done();
    });
  });
});
