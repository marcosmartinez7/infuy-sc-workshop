const TokenToWei = artifacts.require("TokenToWei");
const InfuyToken = artifacts.require("InfuyToken");

module.exports = function(deployer) {
  deployer.deploy(TokenToWei);
  deployer.link(TokenToWei, InfuyToken);
  deployer.deploy(InfuyToken);
};