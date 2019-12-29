pragma solidity >=0.4.21 <0.7.0;

contract EvContract{

    struct carOwner{
        address ownerAddress;
        string name;
        string carNum;
        uint socI;
        uint socR;
    }

    address[] buyerList;
    address[] sellerList;
    address[] idealList;

    mapping(uint => carOwner) public carOwnerInfo;

    address payable public owner;

    event LogTradeElec( 
        address _owner,
        uint num // 
    );

    constructor() public{ 
        owner = msg.sender; 
    }

    function setCarOwner(string memory _name, string memory _carNum, uint _socI, uint _socR) public{
        carOwnerInfo[num] = carOwner(msg.sender, _name, _carNum, _socI, _socR);
        setOwnerState(_socI, _socR);
    }

    function setOwnerState(uint _socI, uint _socR) public{ 
        if(_socI > _socR){
            sellerList.push(msg.sender);
        } else if(_socI < _socR){
            buyerList.push(msg.sender);
        } else{
            idealList.push(msg.sender);
        }
    }


}