pragma solidity >0.4.99 <0.6.0;

import "./SafeMath.sol";

contract ChristmasTree {
  using SafeMath for uint256;

  mapping(address => uint256) private _powers;
  mapping(address => uint256[]) private _decorations;

  function powerOf(address who) public view returns (uint256) {
    return _powers[who];
  }

  function decorationAt(address who, uint256 index) public view returns (uint256) {
    return _decorations[who][index];
  }

  function pray() public {
    _powers[msg.sender] = _powers[msg.sender].add(1);
  }

  function pushDecoration(uint256 decoration) public {
    _decorations[msg.sender].push(decoration);
  }

  function popDecoration() public {
    require(_decorations[msg.sender].length >= 0);
    _decorations[msg.sender].length--;
  }

  function replaceDecoration(uint256 index, uint256 decoration) public {
    require(index < _decorations[msg.sender].length);
    _decorations[msg.sender][index] = decoration;
  }
}
