// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Script.sol";
import "../src/HarrisonToken.sol";

contract Deploy101Token is Script {
    function run() external {
        vm.startBroadcast();
        HarrisonToken token = new HarrisonToken();
        vm.stopBroadcast();

        console.log("HarrisonToken deployed to:", address(token));
    }
}
