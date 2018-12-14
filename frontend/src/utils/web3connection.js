import Web3 from 'web3';

export const setupWeb3 = () => {
  if(typeof window.web3 !== 'undefined') {
    window.web3 = new Web3(window.web3.currentProvider);
  } else {
    window.web3 = new Web3(new Web3.providers.HttpProvider('http://localhost:8545'));
  }
}

export const getBlockNumber = () => {
  return new Promise((resolve, reject) => {
    window.web3.eth.getBlockNumber((err, blockNumber) => {
      if(err) {
        reject(err);
        return;
      }
      resolve(blockNumber);
    });
  });
}