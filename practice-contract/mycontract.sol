pragma solidity ^0.8.14;

contract MyContract {
  //state variables 
  //practice setting variables
    string public myString = "hello world";
    bytes32 public myBytes32 = "hello world"; 
    int public myInt = -1;
    uint public myUint = 1;
    uint256 public myUint256 = 1;
    address public myAddress = 00x5A0b54D5dc17e0AadC383d2db4380a0D3E029c4c;

  struct MyStruct {
    uint myInt;
    string myString;
  }

  MyStruct public myStruct = MyStruct(1, "Hello,World!");

  //local variables 
  function getValue() public pure returns(uint) {
    uint value = 1;
    return value;
  }
}