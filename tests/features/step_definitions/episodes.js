module.exports = function() {

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
    titles = this.zombie.browser.queryAll("article h3")
    if (titles.length === parseInt(number)) {
      return callback();
    } else {
      callback.fail("There aren't " + number + " episode titles on the page");
    }
  });
}
