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

    function transfer(address _to, uint256 _value) public {
        require(_to != address(0), "Invalid recipient address");
        require(balance[msg.sender] >= _value, "Insufficient balance");

        balance[msg.sender] -= _value;
        balance[_to] += _value;
    }

    function burn(uint val) public {
        require(balance[msg.sender] >= val, "Insufficient balance");
        totalSupply -= val;
        balance[msg.sender] -= val;
    }
}
