const TokenToEther = artifacts.require("TokenToEther");
const RskToken = artifacts.require("RskToken");

module.exports = function(deployer) {
  deployer.deploy(TokenToEther);
  deployer.link(TokenToEther, RskToken);
  deployer.deploy(RskToken);
};