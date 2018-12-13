import os 

os.system('vyper -f "abi" contracts/ERC20.vy > abi/ERC20.json')
os.system('vyper -f "bytecode" contracts/ERC20.vy > bytecode/ERC20.txt')