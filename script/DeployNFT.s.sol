// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "forge-std/Script.sol";
import "../src/NFT.sol";

contract DeployNFT is Script {
    function run() external {
        vm.startBroadcast();
        myNFT nft = new myNFT();
        vm.stopBroadcast();

        console.log("myNFT deployed to:", address(nft));
    }
}
