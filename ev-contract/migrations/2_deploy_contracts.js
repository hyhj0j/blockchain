var EvContract = artifacts.require("./EvContract.sol");

module.exports = function(deployer) {
  deployer.deploy(EvContract);
};
