pragma solidity >=0.4.21 <0.7.0;

contract RealEstate {
    struct Buyer{
        address buyerAddress;
        string name;
        uint age;
    }

    mapping (uint => Buyer) public buyerInfo; //mapping(키값 => 밸류값)
    //매물의 id를 키값으로하면, 밸류값으로 해당 매입자의 정보를 불러오는 맵핑구조
    address payable public owner; //owner는 집을 가진 사람 즉 파는사람 & 이 컨트랙트 배포하는 사람
    address[10] public buyers; //매물이 10개밖에 없어서 살수있는 사람도 10명으로 했대

    event LogBuyRealEstate( // 어떤 이벤트가 생성됐을때 그 이벤트 내용도 블록에 저장됨
    // 프론트엔드에서 매입자가 매입하면 완료메시지로 어떤 계정(_buyer)에서 몇번 매물(_id)을 매입했습니다를 보여줄 것임
        address _buyer,
        uint _id
    );

    constructor() public{ //constructor=생성자
        // 밑줄은 이 컨트랙트의 주인은 배포하는데 쓰이는 현재 계정이다라고 선언하는것
        owner = msg.sender; // msg.sender는 현재 사용하는 계정으로 생성자나 함수를 가져옴 (값은 주소형임)
    }

    function buyRealEstate(uint _id, string memory _name, uint _age) public payable{ //payable : eth를 이 함수로 보낼수있게함
        // 여기서 _id는 매물의 id임! 사람xxx
        require(_id >= 0 && _id <= 9); //id가 0-9 사이인지 체크함
        buyers[_id] = msg.sender; //현재 매물을 구매하고있는(msg.sender)를 buyers[_id] 배열에 저장함
        buyerInfo[_id] = Buyer(msg.sender, _name, _age); //구매하려는 사람의 정보를 buyerInfo테이블에 등록함

        owner.transfer(msg.value); //매입가를 owner 주소로 송금함
        //transfer는 eth를 전송할때 사용
        //msg.value는 전송하는 eth의 양 (wei만 허용 eth xx) -> toWei 함수 사용
        emit LogBuyRealEstate(msg.sender, _id); //transfer 후에 매입자(msg.sender)와 매물id를 넘겨 이벤트를 띄움
    }

    function getBuyerInfo(uint _id) public view returns (address, string memory, uint){
        Buyer memory buyer = buyerInfo[_id];
        return (buyer.buyerAddress, buyer.name, buyer.age);
    }

    function getAllBuyers() public view returns(address[10] memory){
        return buyers;
    }

 
}
