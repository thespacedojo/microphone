module.exports = function() {
  chai.should();

  this.Given(/^(\d+) episodes exist$/, function (number, callback) {
    Episode.destroyAll();
    for (x = _i = 1; _i <= number; x = _i += 1) {
      ep = Episode.create({title: "Episode " + x});
    }
    callback();
  });

  this.When(/^I go to the home page$/, function (callback) {
    this.zombie.home(callback)
  });

  this.Then(/^I should see (\d+) episodes with titles$/, function (number, callback) {
    this.zombie.browser.queryAll("article h3").length.should.equal(parseInt(number))
    callback();
  });
}
