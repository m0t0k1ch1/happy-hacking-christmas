var fs   = require('fs');
var Web3 = require('web3');

var web3 = new Web3('wss://ropsten.infura.io/ws');

var letterABI     = JSON.parse(fs.readFileSync('./build/contracts/Letter.json')).abi;
var letterAddress = '0xbaDE12c0bd7943A066e77f0466D529D78d2F70dB';
var letter        = new web3.eth.Contract(letterABI, letterAddress);

var christmasStockingABI     = JSON.parse(fs.readFileSync('./build/contracts/ChristmasStocking.json')).abi;
var christmasStockingAddress = '0x408F56C4541BD00Ec836102d06F7Ee6A2A820678';
var christmasStocking        = new web3.eth.Contract(christmasStockingABI, christmasStockingAddress);

var christmasTreeABI     = JSON.parse(fs.readFileSync('./build/contracts/ChristmasTree.json')).abi;
var christmasTreeAddress = '0x0a97246d46703F72B5c34828f80171F005f66c60';
var christmasTree        = new web3.eth.Contract(christmasTreeABI, christmasTreeAddress);

var santaClausABI     = JSON.parse(fs.readFileSync('./build/contracts/SantaClaus.json')).abi;
var santaClausAddress = '0x05d9cbEe05e82D492ad66842fc7C0Cb363B384EA';
var santaClaus        = new web3.eth.Contract(santaClausABI, santaClausAddress);

var santaClausTokenABI     = JSON.parse(fs.readFileSync('./build/contracts/SantaClaus.json')).abi;
var santaClausTokenAddress = '0xA9B76b79E3254d7835401A8B43aF2FaC93A83F2D';
var santaClausToken        = new web3.eth.Contract(santaClausTokenABI, santaClausTokenAddress);

var account = 'your address';
var privkey = 'your privkey';

sample();

async function sample() {
  web3.eth.accounts.wallet.add(privkey);

  var balance

  balance = await letter.methods.balanceOf(account).call();
  console.log(balance);

  await web3.eth.sendTransaction({
    from: 0,
    to: letterAddress,
    value: 1,
    gas: 50000,
  });

  balance = await letter.methods.balanceOf(account).call();
  console.log(balance);

  await letter.methods.discard().send({
    from: account,
    gas: 50000,
  });

  balance = await letter.methods.balanceOf(account).call();
  console.log(balance);

  web3.currentProvider.connection.close();
}
