import os 

# TODO create function that detects files from ./contracts directory
contracts = ['ERC20', 'nameregistry']

for contract in contracts:
    os.system('vyper -f "abi" contracts/{0}.vy > abi/{0}.json'.format(contract))
    os.system('vyper -f "bytecode" contracts/{0}.vy > bytecode/{0}.txt'.format(contract))