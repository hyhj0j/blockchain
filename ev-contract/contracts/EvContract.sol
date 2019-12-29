pragma solidity >=0.4.21 <0.7.0;

contract EvContract{

    struct carOwner{
        address ownerAddress;
        string name;
        string carNum;
        uint socI;
        uint socR;
    }

    address [] buyerList;
    address [] sellerList;
    address [] idealList;

    mapping(uint => carOwner) public carOwnerInfo;
    //@@@@@@@@@@수정필요@@@@@@ uint는 num이고, num을 키값으로하면, 밸류값으로 해당 carOwner의 정보를 불러오는 맵핑구조
    //num 은 거래 참여를 결심한 사람들에게 부여되는 순차적인 숫자를 나타냄

    event LogTradeElec( // 어떤 이벤트가 생성됐을때 그 이벤트 내용도 블록에 저장됨
    // 프론트엔드에서 거래 완료메시지로 어떤 계정(_owner)들이 얼마(_kw)를 거래했습니다 라고 보여줄 것임
        address _owner,
        uint num // EVtrade에 참여한 num번째 고객입니다란 이벤트 출력함. .. . ... 나도 하기실..ㅀ..
    );

    constructor() public{ //constructor=생성자
        // 밑줄은 이 컨트랙트의 주인은 배포하는데 쓰이는 현재 계정이다라고 선언하는것, 즉 EV코인 창시자 = 나한테 주는건데....ㅠ아 잠깐 무넉 ㅏ이상해
        owner = msg.sender; // msg.sender는 현재 사용하는 계정으로 생성자나 함수를 가져옴 (값은 주소형임)
    }

    function setCarOwner(string _name, string _carNum, uint _socI, uint _socR){ // 정보등록
        carOwnerInfo[num] = carOwner(msg.sender, _name, _carNum, _socI, _socR);
        setOwnerState(_socI, _socR);
    }

    function setOwnerState(uint _socI, uint _socR){ //판매자,구매자,암것도 안하는놈 설정
        if(_socI > _socR){
            sellerList.push(msg.sender);
        } else if(_socI < _socR){
            buyerList.push(msg.sender);
        } else{
            idealList.push(msg.sender);
        }
    }


}

// 1. 화면에 들어가면 이름, 차 정보만 등록하는 폼 나오고 거래풀에 참여하시겠습니까? 뜸 참여클릭하면 바로
// 2. 정보 입력하면 바로 다음 화면으로 자동차 현재 배터리 용량과 원하는 배터리 용량 쓰는 폼 뜸
//      (배터리용량 0~100 기준)
// 3. 내부에서 알아서 판매자 / 구매자로 나뉘어서 매칭 이루어짐 (js에서? or sol에서?) 그리고 거래됨
// 4. 거래 완료 창 ("몇 kw가 충전되었습니다")
// 5. 거래 내역(거래용량 시간 날짜 상대방정보몇개) 확인 하려면 마이페이지에서 할 수 있음
