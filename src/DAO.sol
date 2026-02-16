// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract DAO {

    struct Proposal {
        string description;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 deadline;
        bool executed;
    }

    uint256 public proposalCount;
    address public currentLeader;

    // array to track members
    address[] public members;

    // maps number of proposals
    mapping(uint256 => Proposal) public proposals;

    // stores which proposal someone votes on (proposal number => address and if they've voted or not)
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    // maps if the user is a DAO mamber or not
    mapping(address => bool) public isMember;


    // constructor sets deploy address to the current owner
    constructor() {
        currentLeader = msg.sender;
        members.push(msg.sender);
        isMember[msg.sender] = true;
    }

    function createProposal(string calldata _description, uint256 _duration) external {
        proposalCount++;
        proposals[proposalCount].description = _description;
        proposals[proposalCount].deadline = block.timestamp + _duration;
    }

    function vote(uint256 _proposalId, bool _support) external {
        require(block.timestamp < proposals[_proposalId].deadline, "Voting ended");
        require(!hasVoted[_proposalId][msg.sender], "Already voted");

        hasVoted[_proposalId][msg.sender] = true;

        if (_support) {
            proposals[_proposalId].votesFor++;
        } else {
            proposals[_proposalId].votesAgainst++;
        }

        if (!isMember[msg.sender]) {
            isMember[msg.sender] = true;
            members.push(msg.sender);
        }
    }

    function executeProposal(uint256 _proposalId) external {
        require(block.timestamp >= proposals[_proposalId].deadline, "Voting not ended");
        require(!proposals[_proposalId].executed, "Already executed");

        proposals[_proposalId].executed = true;

        uint256 random = uint256(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, _proposalId)));
        currentLeader = members[random % members.length];
    }
}
