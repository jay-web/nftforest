const contracts = artifacts.require("DigiPets");


module.exports = function(deployer){
    deployer.deploy(contracts);
}