pragma solidity >=0.4.21 <0.7.0;


contract Lottery{
    address public owner;

    constructor() public{
        owner = msg.sender;
    }

    function getSomevalue() public pure returns (uint256 value){
        return 5;
    }

}