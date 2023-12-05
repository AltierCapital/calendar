// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

contract Bank {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        require(amount >= balances[msg.sender], "Not enough funds");

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Withdraw failed");

        balances[msg.sender] -= amount;
    }
}
