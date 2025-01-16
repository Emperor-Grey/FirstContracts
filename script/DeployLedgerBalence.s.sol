// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Register} from "../src/anotherContract.sol";

contract DeployLedgerBalance is Script {
    Register public r;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = 0x7c7f9b2aac806a014c9a26d31d1c21a123aa6e8c130374369b4b5365e7bc347b;
        // Start broadcasting the transaction with the specified private key
        vm.startBroadcast(deployerPrivateKey);

        // Deploy new contract
        r = new Register(0);

        // Stop broadcasting
        vm.stopBroadcast();
    }
}
