// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test, console} from "forge-std/Test.sol";
import {Vm} from "forge-std/Vm.sol";
import {Register} from "../src/anotherContract.sol";

contract RegisterTest is Test {
    Register public r;

    constructor() {}

    function setUp() external {
        r = new Register(0);
    }

    function testRegister_ShouldReturnZero_WhenInitially() public view {
        uint price = r.getPrice();
        assertEq(0, price, "Initially the price should be 0.");
    }

    function testRegister_ShouldUpdateBalance_WhenChangePrice() public {
        uint newPrice = 100;
        r.changePrice(newPrice);

        uint actual_price = r.getPrice();

        assertEq(newPrice, actual_price, "Both should be same");
    }
}
