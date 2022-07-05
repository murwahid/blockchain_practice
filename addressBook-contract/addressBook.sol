pragma solidity ^0.8.3;

contract AddressBook {
    //address to address array
    mapping(address => address[]) private _addresses;
    //mapping inside of a maapping. 
    mapping(address => mapping(address => string)) private aliases;

    //returns the list of addresses in the _addresses map
    function getAddressArray(address addr) public returns(address[] memory) {
        return _addresses[addr];
    }

    function removeAddress(address addr) public {
        //find the length of the array 
        uint arrLength = _addresses[msg.sender].length;
        for(uint i=0;i<arrLength;i++) {
            if(addr == _addresses[msg.sender][i]) {
                if(1 < _addresses[msg.sender].length && i < arrLength-1) {
                    _addresses[msg.sender][i] = _addresses[msg.sender][arrLength-1];
                }
            }
        delete _addresses[msg.sender][arrLength-1]; 
        //_addresses[msg.sender].length--;
        delete aliases[msg.sender][addr]; 
        break;
        }
    }

    function getAlias(address addrowner, address addr) public returns (string memory) {
        return aliases[addrowner][addr];
    } 


}