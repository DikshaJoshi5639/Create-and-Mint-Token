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

    function transfer(address fromSender, address toRece, uint256 _value) external {
        require(fromSender != address(0), "Invalid sender address");
        require(toRece != address(0), "Invalid receiver address");
        require(balance[fromSender] >= _value, "Insufficient balance");

        balance[fromSender] -= _value;
        balance[toRece] += _value;
    }

    function burn(uint val) public {
        require(balance[msg.sender] >= val, "Insufficient balance");
        totalSupply -= val;
        balance[msg.sender] -= val;
    }
}
