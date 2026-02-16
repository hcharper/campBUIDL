// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract HarrisonToken{
    // class names are capitalized

    // who gets the tokens to begin with
    address owner;

    mapping (address user => uint256 balance) public balances;

    constructor() {
        // called when the contract is deployed (one time ONLY)
        owner = msg.sender; // here in the constructor, it is whoever deployed the contract. unique case

        balances[owner] = 1000; //mint the owner 1000 tokens
    }

    function tranfer(uint256 amount, address recipient) public {
        // need 2 parameters 
            // 1- how much you want to send
            // 2 - recipient address

        //check that the sender has the balance to send
        require(balances[msg.sender] >= amount, "Not Enough Funds");

        //check for over/underflow to ensure that end state is the desired result
        require(balances[msg.sender] - amount <= balances[msg.sender]);
        require(balances[recipient] + amount >= balances[recipient]);

        // we also need to add to the recipient account, and subtract frrom the sender account
        balances[msg.sender] -= amount; // ALWAYS SUBTRACT FIRST
        balances[recipient] += amount;
    }
}