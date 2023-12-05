// SPDX-License-Identifier: UNLICENSED
pragma abicoder v2;
pragma solidity ^0.7.6;

import {Test, console2} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";
import {Attacker} from "../src/Attacker.sol";

contract AttackPOCTest is Test {
    Bank public bank;
    Attacker public attacker;

    function setUp() public {
        bank = new Bank();
        attacker = new Attacker{value: 1 ether}(bank);

        bank.deposit{value: 10 ether}();
    }

    function testAttack() public {
        emit log_named_uint(
            "Attacker balance before attack",
            address(attacker).balance
        );
        emit log_named_uint(
            "Contract balance before attack",
            address(bank).balance
        );

        attacker.attack();

        emit log_named_uint(
            "Attacker balance after attack",
            address(attacker).balance
        );
        emit log_named_uint(
            "Contract balance after attack",
            address(bank).balance
        );
    }
}
