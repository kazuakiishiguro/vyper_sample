module.exports = {
  networks: {
    ganache: {
      gasLimit: 99999999999999,
      host: "127.0.0.1",
      netowork_id: "5777",
      port: 8545,
      total_accounts: 10,
      unlocked_accounts: [],
      vmErrorsOnRPCResponse: true
    }
  }
};
