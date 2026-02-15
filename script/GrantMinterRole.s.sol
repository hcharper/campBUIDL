// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract GrantMinterRole is Script {
    function run() external {
        address tokenAddress = vm.envAddress("TOKEN_ADDRESS");
        address tokenShopAddress = vm.envAddress("TOKENSHOP_ADDRESS");

        Token token = Token(tokenAddress);

        vm.startBroadcast();
        token.grantRole(token.MINTER_ROLE(), tokenShopAddress);
        vm.stopBroadcast();

        console.log("Granted MINTER_ROLE to:", tokenShopAddress);
    }
}
