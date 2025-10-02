// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {Raffle} from "src/Raffle.sol";
import {HelperConfig} from "script/HelperConfig.s.sol";
import {VRFCoordinatorV2_5Mock} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/mocks/VRFCoordinatorV2_5Mock.sol";

contract createSubcription is Script {
    function createSubcriptionUsingConfig() public {
        HelperConfig helperConfig = new HelperConfig();
        address vrfCoordinator = helperConfig
            .getConfig()
            .vrfCoordinator;
        createSubcription(vrfCoordinator);
       
    }

    function createSubcription(address vrfCoordinator) public {
        console.log("Creating subscription on ChainID:", block.chainid);
        vm.startBroadcast();
        uint256 subcriptionId = VRFCoordinatorV2_5Mock(vrfCoordinator)
            .createSubscription();
        vm.stopBroadcast();
        return subcriptionId;
    }

    function run() public {}

    function FundSubcription is Script{
function fundSubscriptionUsingConfig(uint256 subcriptionId) public {
        HelperConfig helperConfig = new HelperConfig();
        address vrfCoordinator = helperConfig
            .getConfig()
            .vrfCoordinator;
        fundSubcription(vrfCoordinator, subcriptionId);
}
    }