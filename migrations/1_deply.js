// migrations/2_deploy_contracts.js
const Authentication = artifacts.require("Authentication");

module.exports = function (deployer) {
  deployer.deploy(Authentication, "0xcDD9663C8958C1b6CB383DcD370B8C4a3eD8e793"); // Replace with the actual owner address
};
