// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.13;

contract LedgerBalance {
    mapping(address => uint) balance;

    function updatesBalance(uint _newBalance) public {
        balance[msg.sender] = _newBalance;
    }

    function getBalance() public view returns (uint) {
        return balance[msg.sender];
    }
}

contract Updated {
    LedgerBalance public ledger;

    constructor(address _ledgerAddress) {
        ledger = LedgerBalance(_ledgerAddress);
    }

    function updatesBalance(uint _newBalance) public {
        ledger.updatesBalance(_newBalance);
    }

    function getUpdatedBalance() public view returns (uint) {
        return ledger.getBalance();
    }
}
