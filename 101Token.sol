// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract HarrisonToken{
    // class names are capitalized

    // who gets the tokens to begin with
    address owner:

    mapping (address user => uint256 balance) public balances;

    constructor() {
        // called when the contract is deployed (one time ONLY)
    }
}