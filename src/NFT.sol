// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract myNFT{

    struct Polygon {
        uint numSides;
        string name;
    }

    mapping(uint => address) owners;
    mapping(uint id => Polygon) polygons;

    uint current_id = 0;
    uint limit = 100;

    constructor(){}

    function transfer(address _to, uint _id) external{
        require(owners[_id] == msg.sender, "You are not the owner.");
        require(_to != address(0)); // make sure the address is a real address (not the default (0))
        owners[_id] = _to;
    }

    function mintNFT(uint _numSides, string calldata _name) external{
        require(current_id < limit);
        owners[current_id] = msg.sender;
        polygons[current_id] = Polygon(_numSides, _name);
        current_id ++;
    }

    //function uri(uint _id) view returns(Polygon){}
 
    function updateAttributes(uint _id, uint _numSides, string calldata _name) external {
        require(owners[_id] == msg.sender, "Ypu are not the owner of this NFT");
        polygons[_id] = Polygon(_numSides, _name);
    }

}