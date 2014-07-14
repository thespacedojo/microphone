if (!(typeof MochaWeb === 'undefined')){
  MochaWeb.testOnly(function() {
    chai.should()

    describe("User", function() {

      it("makes the first one an admin", function() {
        Meteor.users.remove();
        Accounts.createUser({email: 'joe@sixpack.com', password: 'abcd1234'})
        console.log Meteor.users.findOne()
        Meteor.users.findOne().admin.to.be.true
      });
    });
  });
}
