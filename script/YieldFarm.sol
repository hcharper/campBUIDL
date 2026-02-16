// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyFarm{

    // track time of last deposit
    mapping(address => uint) public timeOfLastDepositbyUser;

    // track how much deposited
    mapping(address => uint) public amountDeposited;
    // When and How much will allow us to calculate Yield

    // create instance of ERC20 tokens
    address public depositTokenAdress;
    address public rewardTokenAddress;


    constructor(address _depositTokenAddress, address _rewardTokenAddress){
        depositTokenAdress = _depositTokenAddress;
        rewardTokenAddress = _rewardTokenAddress;
    }

    function deposit(uint amountToDeposit) external{

        // call claim first to colelct yield before you deposit again (so you dont miss yield)
        this.claimRewards();

        IERC20(depositTokenAdress).transferFrom(msg.sender, address(this), amountToDeposit); // you can access the future Contract address with (this)
        timeOfLastDepositbyUser[msg.sender] = block.timestamp;
        amountDeposited[msg.sender] += amountToDeposit;
    }

    function claimRewards() external{
        uint rewardAmountPerSecond = 55;
        uint rewardAmount = rewardAmountPerSecond * amountDeposited[msg.sender];
        uint lengthOfDeposit = block.timestamp - timeOfLastDepositbyUser[msg.sender];

        rewardAmount = rewardAmount * lengthOfDeposit;

        // reset the time before you transfer tokens
        timeOfLastDepositbyUser[msg.sender] = block.timestamp;

        IERC20(rewardTokenAddress).transferFrom(address(this), msg.sender, rewardAmount);

        
    }

    function withdraw() external{
        IERC20(depositTokenAdress).transferFrom(address(this), msg.sender, amountDeposited[msg.sender]);

    }
    
}