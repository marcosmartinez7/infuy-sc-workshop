const TokenToEther = artifacts.require("TokenToEther");
const InfuyToken = artifacts.require("InfuyToken");

module.exports = function(deployer) {
  deployer.deploy(TokenToEther);
  deployer.link(TokenToEther, InfuyToken);
  deployer.deploy(InfuyToken);
};