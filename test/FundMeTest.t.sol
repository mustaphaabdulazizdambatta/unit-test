// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.28;

import {Test} from "forge-std/Test";
import {FundMe} from "../FundMe.sol";

contract FundTest is Test {
    FundMe fundMe;
    function setUp() {
        fundMe = new FundMe();
    }
}