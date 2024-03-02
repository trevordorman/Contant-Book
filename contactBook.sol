// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

contract HW3{

    function doMath(int256 x, int256 y) external pure returns (int256) {
        return (2 * x) + (2 * y);
    }

    function getMax(uint[] calldata array) public pure returns(uint256){
        uint256 max = 0;
        uint256 i;
        for(i=0; i < array.length; i++){
            if (max < array[i]){
                max = array[i];
            }
        }
        return max;
    }

   function hashStringArray (string[] calldata stringArray) public pure returns (bytes32[] memory){
       uint256 i;
       bytes32[] memory memArray = new bytes32[] (stringArray.length);
       for(i=0; i < stringArray.length; i++){
        memArray [i] = keccak256(abi.encode(stringArray[i]));
       }
       return memArray;
   }

    mapping(address => address[]) private _addresses;

   function getContacts(address caller) external view returns (address[] memory){
       return _addresses[caller];
   }
   function addContact(address contact) external{
       _addresses[msg.sender].push(contact);
   }
    function setContacts(address[] calldata contacts) external{
    uint256 i;
           _addresses[msg.sender][i] = contacts[i];
    }
    
    mapping (address => mapping(address => string)) private _nickname;
    function getNickname(address caller, address contact) external view returns (string memory){
        return _nickname [caller][contact];
    }
    function setNickname(address contact, string calldata nickname) external{
        _addresses [msg.sender].push(contact);
        _nickname [msg.sender][contact] = nickname;
    }
}
