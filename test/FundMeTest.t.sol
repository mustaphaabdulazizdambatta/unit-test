// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundTest is Test {
    FundMe fundMe;
    function setUp() {
        fundMe = new FundMe();
    }
}