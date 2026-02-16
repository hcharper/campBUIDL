// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/TokenShop.sol";

contract DeployTokenShop is Script {
    function run() external {
        address tokenAddress = vm.envAddress("TOKEN_ADDRESS");

        vm.startBroadcast();
        TokenShop shop = new TokenShop(tokenAddress);
        vm.stopBroadcast();

        console.log("TokenShop deployed to:", address(shop));
    }
}
