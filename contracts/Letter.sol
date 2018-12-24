pragma solidity >0.4.99 <0.6.0;

import "./SafeMath.sol";

contract Letter {
  using SafeMath for uint256;

  mapping(address => uint256) private _balances;
  mapping(address => bool) private _isSealeds;

  function balanceOf(address who) public view returns (uint256) {
    return _balances[who];
  }

  function isSealed(address who) public view returns (bool) {
    return _isSealeds[who];
  }

  function () payable external {
    require(!_isSealeds[msg.sender]);
    _balances[msg.sender] = _balances[msg.sender].add(msg.value);
  }

  function seal() public {
    require(_balances[msg.sender] > 0);
    _isSealeds[msg.sender] = true;
  }

  function discard() public {
    uint256 balance = _balances[msg.sender];
    _balances[msg.sender] = 0;
    _isSealeds[msg.sender] = false;
    msg.sender.transfer(balance);
  }
}
