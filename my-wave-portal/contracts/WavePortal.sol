//license 
pragma solidity ^0.8.0;
import "hardhat/console.sol";


//contract declaration 
contract WavePortal {
    uint256 totalWaves;

    //constructor 
    constructor() {
    }

    function wave() public { //this function adds new waves to waveCounter
        totalWaves +=1;
        console.log("%s has waved", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) { //this function gets all the waves 
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}