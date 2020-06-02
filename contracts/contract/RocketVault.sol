pragma solidity 0.6.8;

// SPDX-License-Identifier: GPL-3.0-only

import "./RocketBase.sol";
import "../interface/RocketVaultInterface.sol";

// ETH and rETH are stored here to prevent contract upgrades from affecting balances

contract RocketVault is RocketBase, RocketVaultInterface {

	// Construct
    constructor(address _rocketStorageAddress) RocketBase(_rocketStorageAddress) public {
        version = 1;
    }

    // Accept an ETH deposit
    // Only accepts calls from the RocketDepositPool contract
    function depositEther() override external payable onlyLatestContract("rocketDepositPool", msg.sender) {}

    // Withdraw an amount of ETH to a specified address
    // Only accepts calls from the RocketDepositPool contract
    function withdrawEther(address _withdrawalAddress, uint256 _amount) override external onlyLatestContract("rocketDepositPool", msg.sender) {}

}