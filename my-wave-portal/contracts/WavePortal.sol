//license 
pragma solidity ^0.8.0;
import "hardhat/console.sol";


//contract declaration 
contract WavePortal {
    uint256 totalWaves;

    event NewWave(address indexed from, uint256 timestamp, string message); 

    //custom wave datatype 
    struct Wave {
        address waver;
        string message;
        uint timestamp;
    }

    //array of structs 
    Wave[] waves;

    //constructor 
    constructor() payable {
        console.log("I am a smart contract Dogg!");
    }

    function wave(string memory _message) public { //this function adds new waves to waveCounter
        totalWaves +=1;
        console.log("%s has waved", msg.sender, _message);

        //store the new message in the array 
        waves.push(Wave(msg.sender,_message, block.timestamp));

        //
        emit NewWave(msg.sender, block.timestamp, _message);
        uint256 prizeAmount = 0.0001 ether;
        require(prizeAmount <= address(this).balance, "Trying to withdraw more money than contract has.");
        (bool success,) = (msg.sender).call{value:prizeAmount}("");
        require(success, "Failed to withdraw money from contract");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) { //this function gets all the waves 
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}