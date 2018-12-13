# Events
Transfer: event({_from: indexed(address), _to: indexed(address), _value: uint256(wei)})
Approval: event({_owner: indexed(address), _spender: indexed(address), _value: uint256(wei)})

# Variables
balances: uint256(wei)[address]
allowances: (uint256(wei)[address])[address]
num_issued: uint256(wei)

@public
@payable
def deposit():
    _value: uint256(wei) = msg.value
    _sender: address = msg.sender
    self.balances[_sender] = self.balances[_sender] + _value
    self.num_issued = self.num_issued + _value
    log.Transfer(0x0000000000000000000000000000000000000000, _sender, _value)

@public
def withdraw(_value : uint256(wei)) -> bool:
    _sender: address = msg.sender
    self.balances[_sender] = self.balances[_sender] - _value
    self.num_issued = self.num_issued - _value
    send(_sender, _value)
    log.Transfer(_sender, 0x0000000000000000000000000000000000000000, _value)
    return True

@public
@constant
def totalSupply() -> uint256(wei):
    return self.num_issued

@public
@constant
def balanceOf(_owner : address) -> uint256(wei):
    return self.balances[_owner]

@public
def transfer(_to : address, _value : uint256(wei)) -> bool:
    _sender: address = msg.sender
    self.balances[_sender] = self.balances[_sender] - _value
    self.balances[_to] = self.balances[_to] + _value
    log.Transfer(_sender, _to, _value)
    return True

@public
def transferFrom(_from : address, _to : address, _value : uint256(wei)) -> bool:
    _sender: address = msg.sender
    allowance: uint256(wei) = self.allowances[_from][_sender]
    self.balances[_from] = self.balances[_from] - _value
    self.balances[_to] = self.balances[_to] + _value
    self.allowances[_from][_sender] = allowance - _value
    log.Transfer(_from, _to, _value)
    return True
    
@public
def approve(_spender : address, _value : uint256(wei)) -> bool:
    _sender: address = msg.sender
    self.allowances[_sender][_spender] = _value
    log.Approval(_sender, _spender, _value)
    return True

@public
@constant
def allowance(_owner : address, _spender : address) -> uint256(wei):
    return self.allowances[_owner][_spender]