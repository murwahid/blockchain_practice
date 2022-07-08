//license 
pragma solidity ^0.8.3; 

//contract declaration 
contract PiggyBank {
    //events 
    event Deposit(uint amount);
    event Withdraw(uint amount);
    
    //state variables
    address public owner = msg.sender; 
    //uint public balance;

    //==functions==

    //receive ether
    receive() external payable {
        emit Deposit(msg.value);
    }

    //withdraw 
    function withdraw() external{ 
        //validation
        require(msg.sender == owner, "WITHDRAWAL INCOMPLETE. Must be owner to withdraw from Piggy Bank"); 
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }

    //getBalance 
    //custom function
    function getBalance() external view returns (uint balance){
        require(msg.sender == owner, "BALANCE REQUEST REJECTED. Must be owner to get the piggybank balance"); 
        balance = address(this).balance;
    }
}