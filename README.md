## Create and Mint Token
This is a Smart Contract that creats an ERC20 token which is implemented on the Ethereum blockchain. It allows Owners to create and manage tokens along with the standard functionalities for the users to transfer and burn Tokens.

## Description
This program is a Smart contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain.The Contract has 3 Functions and 1 Modifier
1. mint(address toThePer, uint val): This function is used to add tokens to the owner address. This is only accessed by the owner and anyother user with different address cannot upgrade it.
2. transfer(address fromSender, address toRece, uint256 val): This Function is used to transfer tokens from one account to another account, this can be accessed by any other user apart from the owner.
3. burn(uint val): This function is used to burn tokens from of the owner account and it can be accessed by any other user as well.
4. onlyOwner(): This is the modifier which ensures that only the owner of the contract can call functions that use this modifier.

## Getting Started
### Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.
1.Now after opening the link you will click on the "File Explorer" option on the extreme left of the screen,then click on "create new file".
2.Save the file with .sol extension (For Eg. myTokens.sol).
3.Copy paste the following code on your remix platform.

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract MyToken {
    string public tokenName = "CRAFTERS";
    string public tokenAbr = "CFT";
    uint public totalSupply = 0;
    address public owner = msg.sender;
    mapping(address => uint) public balance;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function mint(address toThePer, uint val) public onlyOwner {
        totalSupply += val;
        balance[toThePer] += val;
    }

    function transfer(address fromSender, address toRece, uint256 val) external {
        require(fromSender != address(0), "Invalid sender address");
        require(toRece != address(0), "Invalid receiver address");
        require(balance[fromSender] >= val, "Insufficient balance");

        balance[fromSender] -= val;
        balance[toRece] += val;
    }

    function burn(uint val) public {
        require(balance[msg.sender] >= val, "Insufficient balance");
        totalSupply -= val;
        balance[msg.sender] -= val;
    }
}
```
4. To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.18" (or another compatible version), and then click on the "Compile TokenCreationAndMint.sol" button.
5. Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar.Then click on the "Deploy" button.
6. Once the code is deployed click on the mint button and copy paste the owner address from the owner button and add tokens.
7. To burn tokens add the value accordingly and keep in mind that if you add more value to burn than your total value than the function will simply compiled but the output will not changed.
8. Similarly in the transfer button write the owner address as well as the rceiver address along with the value to transfer tokens accordingly.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
