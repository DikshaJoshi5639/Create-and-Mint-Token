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

    function transfer(address fromSender, address toRece, uint val) external { 
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

    function transferTokens(address toRece, uint val) external {
        require(msg.sender != address(0), "Invalid sender address");
        require(toRece != address(0), "Invalid receiver address");
        require(balance[msg.sender] >= val, "Insufficient balance");

        balance[msg.sender] -= val;
        balance[toRece] += val;
    }
}
