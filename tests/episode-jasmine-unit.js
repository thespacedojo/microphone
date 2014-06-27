(function () {
  "use strict";

  jasmine.DEFAULT_TIMEOUT_INTERVAL = jasmine.getEnv().defaultTimeoutInterval = 20000;

  describe("Episode", function () {

    it("@slugify", function () {
      title = "Slug Me Up!"
      expect(Episode.slugify(title)).toBe('slug-me-up')
    });
  });
})
