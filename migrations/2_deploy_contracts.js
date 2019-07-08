
const InfuyToken = artifacts.require("InfuyToken");

module.exports = function(deployer) {
  deployer.deploy(InfuyToken);
};