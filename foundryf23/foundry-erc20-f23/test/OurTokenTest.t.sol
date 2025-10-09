// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {OurToken} from "../src/OurToken.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";

contract OurTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address ghost = makeAddr("WEBGHOST");
    address mumin = makeAddr("DEFI MUMIN");

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();
        vm.prank(address(deployer));
        ourToken.transfer(ghost, STARTING_BALANCE);
    }

    function testGhostBalance() public view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(ghost));
    }

    function testAllowances() public {}
}
