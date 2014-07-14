if (!(typeof MochaWeb === 'undefined')){
  MochaWeb.testOnly(function() {
    chai.should()

    describe("Episode", function() {
      var episode;

      before(function() {
        episode = Episode.create({title: 'Episode 15 - Google Ventures'})
      });

      after(function() {
        episode.destroy();
      });

      describe("slugify on creation", function() {
        it("creates a slug from the title", function() {
          episode = Episode.first({title: 'Episode 15 - Google Ventures'})
          episode.slug.should.equal('episode-15-google-ventures');
        });
      });

      describe("should display on the episodes template", function() {
        var div;
        before(function() {
          div = document.createElement("DIV");
          comp = UI.renderWithData(Template.episode, episode);
          UI.insert(comp, div)
        });
        it("Title", function() {
          $(div).html().should.include('Episode 15 - Google Ventures')
        });

        it("with an episode link", function() {
          link = '/episode/episode-15-google-ventures'
          $(div).find('a').prop('href').should.include(link)
        });
      });
    });
  });
}
