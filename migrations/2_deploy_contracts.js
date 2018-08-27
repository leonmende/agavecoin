var agavecoin = artifacts.require("./agavecoin.sol");

module.exports = function(deployer) {
   deployAgavecoin(deployer);
};

function deployAgavecoin(deployer) {

   const accounts = web3.eth.accounts;

   //const startTime = latestTime();
   //const endTime = startTime + duration.days(45);
   //const rate = 2500;
   //const goal = web3.toWei(250, 'ether');
   //const cap = web3.toWei(4000, 'ether');
   const wallet = accounts[0];

   return deployer.deploy(agavecoin, wallet, { gas: 300000 });

}

