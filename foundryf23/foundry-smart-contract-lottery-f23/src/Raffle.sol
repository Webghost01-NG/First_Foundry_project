// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/**
 * @title A simple raffle contract
 * @author WEB GHOST
 * @notice This contract is for creating a simple raffle system where users can enter by paying a fee and a random winner is selected
 * @dev implenment chainlink vrfv.25
 */
contract Raffle {
    error NotEnoughEthsENT();
    uint256 private i_entranceFee;
    uint256 private i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_player;
    event raffleEntered(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() public payable {
        // require(msg.value >= i_entranceFee, "Not Enough Eth");
        if (msg.value < i_entranceFee) {
            revert NotEnoughEthsENT();
        }
        s_player.push(payable(msg.sender));
        emit raffleEntered(msg.sender);
    }

    function pickWinner() external {
        block.timestamp - s_lastTimeStamp > i_interval;
    }

    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}
