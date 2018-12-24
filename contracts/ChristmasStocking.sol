pragma solidity >0.4.99 <0.6.0;

import "./SafeMath.sol";

contract ChristmasStocking {
  using SafeMath for uint256;

  bool private _isOpen;
  mapping(address => uint256) private _balances;

  constructor() public {
    _isOpen = false;
  }

  function isOpen() public view returns (bool) {
    return _isOpen;
  }

  function balanceOf(address who) public view returns (uint256) {
    return _balances[who];
  }

  function deposit() payable public {
    _isOpen = true;
    (bool success,) = msg.sender.call.value(msg.value)(abi.encodePacked());
    require(success);
    _isOpen = false;
  }

  function bribe() payable public {
    require(_isOpen);
    _balances[tx.origin] = _balances[tx.origin].add(msg.value);
  }

  function withdraw() public {
    uint256 balance = _balances[msg.sender];
    _balances[msg.sender] = 0;
    msg.sender.transfer(balance);
  }
}
