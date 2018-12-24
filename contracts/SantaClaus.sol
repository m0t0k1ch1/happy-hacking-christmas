pragma solidity >0.4.99 <0.6.0;

import "./ChristmasStocking.sol";
import "./ChristmasTree.sol";
import "./Letter.sol";
import "./SantaClausToken.sol";
import "./Ownable.sol";

contract SantaClaus is Ownable {
  ChristmasStocking private _christmasStocking;
  ChristmasTree private _christmasTree;
  Letter private _letter;
  SantaClausToken private _token;

  constructor(address stocking, address tree, address payable letter, address token) Ownable() public {
    _christmasStocking = ChristmasStocking(stocking);
    _christmasTree = ChristmasTree(tree);
    _letter = Letter(letter);
    _token = SantaClausToken(token);
  }

  function christmasStocking() public view returns (address) {
    return address(_christmasStocking);
  }

  function christmasTree() public view returns (address) {
    return address(_christmasTree);
  }

  function letter() public view returns (address) {
    return address(_letter);
  }

  function token() public view returns (address) {
    return address(_token);
  }

  function requestToken() public {
    require(_letter.isSealed(msg.sender));
    require(_christmasStocking.balanceOf(msg.sender) > 0);
    require(_christmasTree.powerOf(msg.sender) > 99999999);
    require(_token.balanceOf(msg.sender) == 0);

    // Congratulations!!
    _token.mint(msg.sender, 1);
  }

  function renounceTokenOwnership() public onlyOwner {
    _token.renounceOwnership();
  }

  function transferTokenOwnership(address newOwner) public onlyOwner {
    _token.transferOwnership(newOwner);
  }
}
