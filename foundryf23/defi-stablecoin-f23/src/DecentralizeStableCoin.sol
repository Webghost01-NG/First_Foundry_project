// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
@title Decentralize Stable Coin
@minting Author: W3B GHOST
@notice This contract is for creating a stable coin that is decentralized and backed by crypto assets.
*/
contract DecentralizeStableCoin is ERC20Burnable, Ownable {
    error DecentralizeStableCoin_MustBeMoreThanZero();
    error DecentralizeStableCoin_BurnAmountExceedsBalance();
    error DecentralizeStableCoin_NotZeroAddress();

    constructor() ERC20("Decentralize Stable Coin", "DSC") {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0 || _amount > balance) {
            revert DecentralizeStableCoin_MustBeMoreThanZero();
        }
        if (balance < _amount) {
            revert DecentralizeStableCoin_BurnAmountExceedsBalance();
        }
        super.burn(_amount);
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralizeStableCoin_NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralizeStableCoin_MustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }
}
