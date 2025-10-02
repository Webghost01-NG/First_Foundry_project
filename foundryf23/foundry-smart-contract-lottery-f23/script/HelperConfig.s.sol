// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {VRFCoordinatorV2_5Mock} from "lib/chainlink-brownie-contracts/contracts/src/v0.8/mocks/VRFCoordinatorV2_5Mock.sol";

abstract contract CodeConstants{
    uint96 public constant BASE_FEE = 0.25 ether;
    uint96 public constant MOCK_GAS_PRICE_LINK = 1e9; // 0.000000001 LINK per gas
    int256 public MOCK_WEI_PER_UINT_LINK = 300000000;
}

contract HelperConfig is Script {
    struct NetworkConfig {
        uint256 entranceFee;
        uint256 interval;
        address vrfCoordinator;
        bytes32 gasLane;
        uint256 subcriptionId;
        uint32 callbackGasLimit;
    } 
        
    NetworkConfig public localNetworkConfig;
    mapping(uint256 chainId => NetworkConfig) public NetworkConfigs;

    constructor() {
        NetworkConfigs[11155111] = getSepoliaEthConfig();
    }

    function getConfigByChaunId(uint256 chainId) public returns (NetworkConfig memory){
        if (NetworkConfigs[chainId].vrfCoordinator != address(0)) {
            return NetworkConfigs[chainId];
        } else if 
        return () {
            getOrCreateAnvilEthConfig()
        } else {      
             revert();
        }
    }

    function getConfig() public  returns (NetworkConfig memory){
        return getConfigByChaunId(block.chainid);
    }

    function getSepoliaEthConfig() public returns(NetworkConfig memory){
        return NetworkConfig({
            entranceFee: 0.01 ether,
            interval: 30,
            vrfCoordinator: 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625,
            gasLane: 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c,
            subcriptionId: 1234, // add your subscription id here
            callbackGasLimit: 100000
        });
    }
    function getOrCreateAnvilEthConfig() public returns(NetworkConfig memory){
        if (localNetworkConfig.vrfCoordinator != address(0)) {
            return localNetworkConfig;
        }
        uint256 subcriptionId = createNewSubcription();
        return NetworkConfig({
            entranceFee: 0.01 ether,
            interval: 30,
            vrfCoordinator: 0x8103B0A8A00be2DDC778e6e7eaa21791Cd364625,
            gasLane: 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c,
            subcriptionId: subcriptionId,
            callbackGasLimit: 100000
        });
    }
    vm.startBroadcast();
    VRFCoordinatorV2_5Mock vrfCoordinator = new VRFCoordinatorV2_5Mock (MOCK_GAS_PRICE_LINK,MOCK_WEI_PER_UINT_LINK,BASE_FEE); (
        0.1 ether, // 0.1 LINK per request
        1e9 // 0.000000001 LINK per gas
    );
    vm.stopBroadcast();

    localNetworkConfig = NetworkConfig({
        entranceFee: 0.01 ether,
        interval: 30,
        vrfCoordinator: address(vrfCoordinator),
        gasLane: 0x474e34a077df58807dbe9c96d3c009b23b3c6d0cce433e59bbf5b34f823bc56c,
        subcriptionId: subcriptionId,
        callbackGasLimit: 100000
    });
    return localNetworkConfig;
}