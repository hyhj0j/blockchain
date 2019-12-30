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
        //deposit();
        uint defaultEvToken = 10;
        transferFrom(publisher, msg.sender, defaultEvToken);
    }

    
    function getCarOwner(uint _id) public view returns(address, string memory, string memory){
        carOwner memory carowner = carOwnerInfo[_id];
        return (carowner.ownerAddress, carowner.name, carowner.carNum);
    }


    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){
    _balances[_from] = _balances[_from].sub(_value);
    _balances[_to] = _balances[_to].add(_value);
    _allowances[_from][msg.sender] = _allowances[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

}