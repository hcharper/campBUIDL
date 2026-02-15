// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract DeployToken is Script {
    function run() external {
        vm.startBroadcast();
        Token token = new Token();
        vm.stopBroadcast();

        console.log("Token (HH) deployed to:", address(token));
    }
}
