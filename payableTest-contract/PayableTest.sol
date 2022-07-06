//license 
pragma solidity ^0.8.3;

//contract declaration

contract PayableTest {
    //===state variables===
    //what type is the variable? address?
    // is it payable? yes => add payable. 
    // should other people have access to it? Yes => Make it public. 
    address payable public Sender;

    //===constructor===
    constructor() {
        Sender = payable(msg.sender);
    }

    //---functions---

    //deposit
    function deposit() external payable {}

    //getBalance
    //uint when it is a balance
    function getBalance() external view returns (uint) {
        return address (this).balance;
    }

}