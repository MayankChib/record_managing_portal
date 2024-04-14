const TransactionStorageContract = artifacts.require("TransactionStorageContract");

module.exports = function (deployer) {
    deployer.deploy(TransactionStorageContract);
}