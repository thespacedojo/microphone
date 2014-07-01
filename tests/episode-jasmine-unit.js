(function () {
  describe("Episode", function () {

    it("@slugify", function () {
      title = "Slug Me Up!"
      expect(Episode.slugify(title)).toBe('slug-me-up')
    });
  });
})();
