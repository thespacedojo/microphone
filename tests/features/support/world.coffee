module.exports = ->

  @World = class MultiWorld extends Cucumber.World

    constructor: ->
      chai.should()
      @zombie = new Cucumber.World.Zombie
      super
