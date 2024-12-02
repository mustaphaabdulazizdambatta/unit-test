// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.10;

import {Test} from "forge-std/Test.sol";
import {Safe} from "../src/Safe.sol";

contract SafeTest is Test {
    Safe safe;

    // Needed so the test contract itself can receive ether
    // when withdrawing
    receive() external payable {}

    function setUp() public {
        safe = new Safe();
    }

    function test_Withdraw() public {
        // Step 1: Send 1 ether to the `Safe` contract
        payable(address(safe)).transfer(1 ether);

        // Step 2: Record the balance of the `SafeTest` contract before withdrawal
        uint256 preBalance = address(this).balance;

        // Step 3: Call the `withdraw()` function on the `Safe` contract
        safe.withdraw();

        // Step 4: Record the balance of the `SafeTest` contract after withdrawal
        uint256 postBalance = address(this).balance;

        // Step 5: Assert that the difference in balances is equal to 1 ether
        assertEq(preBalance + 1 ether, postBalance);
    }
}


/*Key Points

Transfer Funds to Safe:

payable(address(safe)).transfer(1 ether);

    Sends 1 ether to the Safe contract's address using transfer().

Pre-Balance Check:

uint256 preBalance = address(this).balance;

    Records the balance of the test contract (SafeTest) before calling withdraw().

Withdraw Funds:

safe.withdraw();

    Calls the withdraw() function of the Safe contract, which transfers its balance to the caller (msg.sender).

Post-Balance Check:

uint256 postBalance = address(this).balance;

    Records the balance of the test contract after calling withdraw().

Assertion:

assertEq(preBalance + 1 ether, postBalance);

    Confirms that the balance of the test contract has increased by exactly 1 ether, verifying the correctness of the withdraw() function.
    */