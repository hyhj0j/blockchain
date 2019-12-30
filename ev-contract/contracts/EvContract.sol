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



    address payable public publisher;
    address[9] public carowners;

    mapping (uint => carOwner) public carOwnerInfo;
    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;


    event logSetCarOwner(
        address carOwner,
        uint _id
    );


    constructor() public{
        publisher = msg.sender;
        _mint(publisher, INITIAL_SUPPLY);
    }

    function setCarOwner(uint _id, string memory _name, string memory _carNum, uint _socI, uint _socR) payable public{
        require(_id >= 0 && _id <= 8);
        carowners[_id] = msg.sender;
        carOwnerInfo[_id] = carOwner(msg.sender, _name, _carNum, _socI, _socR);
        deposit();
    }

    
    function getCarOwner(uint _id) public view returns(address, string memory, string memory){
        carOwner memory carowner = carOwnerInfo[_id];
        return (carowner.ownerAddress, carowner.name, carowner.carNum);
    }


    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){


    _balances[_from] = _balances[_from].sub(_value);

    _balances[_to] = _balances[_to].add(_value);

    _allowed[_from][msg.sender] = _allowed[_from][msg.sender].sub(_value);

    emit Transfer(_from, _to, _value);

    return true;

  }
    /*** 
    function deposit() payable public{
        publisher.transfer(msg.value);
        uint evToken = (msg.value * 10) / 1 ether;
        this._balances = this._balances[msg.sender].add(evToken);
    }

    function () payable public{
        deposit();
    }
    ***/

    


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