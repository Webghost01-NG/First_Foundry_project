// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @notice This is a mock of Chainlink's AggregatorV3Interface
 * Used for local testing on Anvil/Hardhat without live price feeds.
 */
contract MockV3Aggregator {
    uint8 public decimals;
    int256 public latestAnswer;

    event AnswerUpdated(int256 indexed current, uint256 indexed roundId, uint256 updatedAt);

    constructor(uint8 _decimals, int256 _initialAnswer) {
        decimals = _decimals;
        latestAnswer = _initialAnswer;
    }

    function updateAnswer(int256 _answer) public {
        latestAnswer = _answer;
        emit AnswerUpdated(_answer, 0, block.timestamp);
    }

    function latestRoundData()
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound
        )
    {
        return (0, latestAnswer, block.timestamp, block.timestamp, 0);
    }
}
