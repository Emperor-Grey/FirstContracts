// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(1);
    }

    function test_Increment() public {
        counter.increment();
        assertEq(counter.number(), 2);
    }

    function test_decrement() public {
        counter.decrement();
        assertEq(counter.number(), 0);
    }

    function testFuzz_SetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testCounter_ShouldReturnNumber_WhenCalled() public {
        uint256 expected = counter.number();
        uint256 actual = counter.getNumber();
        assertEq(
            expected,
            actual,
            "getNumber() should return the same value as number()"
        );

        counter.setNumber(42);
        uint256 new_expected = counter.getNumber();
        assertEq(
            new_expected,
            42,
            "getNumber() should return the updated value."
        );
    }
}
