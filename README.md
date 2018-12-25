# happy-hacking-christmas

[Happy Hacking Christmas](https://m0t0k1ch1st0ry.com/blog/2018/12/25/happy-hacking-christmas) 🎅

If you can win SantaClausToken (SCT) from the `SantaClaus` contract, it means that you are a great hacker! For winning SCT, you have to call the `requestToken()` function in the `SantaClaus` contract after satisfying some conditions.

``` solidity
function requestToken() public {
  require(_letter.isSealed(msg.sender));
  require(_christmasStocking.balanceOf(msg.sender) > 0);
  require(_christmasTree.powerOf(msg.sender) > 99999999);
  require(_token.balanceOf(msg.sender) == 0);

  // Congratulations!!
  _token.mint(msg.sender, 1);
}
```

## Deployed contracts (Ropsten testnet)

- 💌 Letter：[0xbade12c0bd7943a066e77f0466d529d78d2f70db](https://ropsten.etherscan.io/address/0xbade12c0bd7943a066e77f0466d529d78d2f70db#code)
- 🧦  ChristmasStocking：[0x408f56c4541bd00ec836102d06f7ee6a2a820678](https://ropsten.etherscan.io/address/0x408f56c4541bd00ec836102d06f7ee6a2a820678#code)
- 🎄 ChristmasTree：[0x0a97246d46703f72b5c34828f80171f005f66c60](https://ropsten.etherscan.io/address/0x0a97246d46703f72b5c34828f80171f005f66c60#code)
- 🎅 SantaClaus：[0x05d9cbee05e82d492ad66842fc7c0cb363b384ea](https://ropsten.etherscan.io/address/0x05d9cbee05e82d492ad66842fc7c0cb363b384ea#code)
- 💎 SantaClausToken：[0xa9b76b79e3254d7835401a8b43af2fac93a83f2d](https://ropsten.etherscan.io/address/0xa9b76b79e3254d7835401a8b43af2fac93a83f2d#code)

## How to use the sample script for the challengers

You have to

- install [yarn](https://github.com/yarnpkg/yarn)
- replace the variables `address` and `privkey` in `scripts/sample.js` with your own values

in advance.

``` sh
$ yarn install
$ node scripts/sample.js
```
