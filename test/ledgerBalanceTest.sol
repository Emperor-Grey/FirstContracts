// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {LedgerBalance, Updated} from "../src/ledgerBalance.sol";

contract LedgerBalanceTest is Test {
    LedgerBalance public ledger;
    Updated public updated;

    address public testAddress = address(0x123); // Dummy Address

    function setUp() public {
        ledger = new LedgerBalance();
        updated = new Updated(address(ledger));

        ledger.updatesBalance(0);
    }

    function testLedger_ShouldReturnZero_Initially() public view {
        uint initialBalance = ledger.getBalance();
        assertEq(initialBalance, 0, "Initial balance should be 0");
    }

    function testLedger_ShouldUpdateBalance_WhenUpdateBalance() public {
        uint newBalance = 100;
        ledger.updatesBalance(newBalance);

        uint balance = ledger.getBalance();

        assertEq(
            balance,
            newBalance,
            "LedgerBalance should have updated the balance"
        );

        updated.updatesBalance(newBalance);
        uint updatedBalance = updated.getUpdatedBalance();

        assertEq(
            updatedBalance,
            newBalance,
            "Updated contract should update the balance in LedgerBalance"
        );
    }
}
