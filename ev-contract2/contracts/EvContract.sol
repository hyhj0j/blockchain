pragma solidity >=0.4.21 <0.7.0;

import "./ERC20.sol";

contract EvContract is ERC20{

    struct carOwner{
        address ownerAddress;
        string name;
        string carNum;
        uint socI;
        uint socR;
    }

    string public constant name = "EV token";
    string public constant symbol = "EVT";
    uint public constant decimals = 18;
    uint public constant INITIAL_SUPPLY = 1000 * (10 ** decimals);


    // address[] buyerList;
    // address[] sellerList;
    // address[] idealList;

    address payable public publisher;
    uint cnt=0;

    mapping(uint => carOwner) public carOwnerInfo;

    constructor() public{
        publisher = msg.sender;
        _mint(publisher, INITIAL_SUPPLY);
        totalSupply();
        balanceOf(msg.sender);
    }

    function setCarOwner(string memory _name, string memory _carNum, uint _socI, uint _socR) public{
        carOwnerInfo[cnt] = carOwner(msg.sender, _name, _carNum, _socI, _socR);
    //    setOwnerState(_socI, _socR);
        cnt += 1;
    }

    
    function getCarOwner() public view returns(string memory){
        for(uint8 i = 0; i<cnt ; i++)
            return carOwnerInfo[0].name;
    }

    


    // function setOwnerState(uint _socI, uint _socR) public{
    //     if(_socI > _socR){
    //         sellerList.push(msg.sender);
    //     } else if(_socI < _socR){
    //         buyerList.push(msg.sender);
    //     } else{
    //         idealList.push(msg.sender);
    //     }
    // }


}