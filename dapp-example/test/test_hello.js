const helloworld = artifacts.require("HelloWorld");

contract("HelloWorld", function(accounts){

    before(async () => {
        this.instance = await helloworld.deployed();
    });

    it ("should be initailized with correct value", async () => {
        const greeting = await this.instance.greeting();

        assert.equal(greeting, "Goodbye World!", "Wrong initailized value!");
    });

    it ("should chage the greeting", async () => {
        const val = "Hello, Blockchanin!";
        await this.instance.setGreeting(val, {from: accounts[0]});
        const greeting = await this.instance.say();
        assert.equal(greeting, val, "does not change the value!");
    });
});