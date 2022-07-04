//compiler version
pragma solidity ^0.8.6;

//CONTRACT NAME 
contract MyFirstContract {

    string private name; 
    uint private age;

    function setName(string memory newName) public {
        name = newName;
    }
    
    //what does view mean? 
    function getName() public view returns (string memory) {
        return name;
    }

    //setAge 
    function setAge(uint newAge) public {
        age = newAge;
    }

    //getAge
    //does the return console.log
    function getAge() public view returns (uint) {
        return age;
    }
}