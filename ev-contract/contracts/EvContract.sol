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
    //@@@@@@@@@@�����ʿ�@@@@@@ uint�� num�̰�, num�� Ű�������ϸ�, ��������� �ش� carOwner�� ������ �ҷ����� ���α���
    //num �� �ŷ� ������ ����� ����鿡�� �ο��Ǵ� �������� ���ڸ� ��Ÿ��

    event LogTradeElec( // � �̺�Ʈ�� ���������� �� �̺�Ʈ ���뵵 ��Ͽ� �����
    // ����Ʈ���忡�� �ŷ� �Ϸ�޽����� � ����(_owner)���� ��(_kw)�� �ŷ��߽��ϴ� ��� ������ ����
        address _owner,
        uint num // EVtrade�� ������ num��° ���Դϴٶ� �̺�Ʈ �����. .. . ... ���� �ϱ��..��..
    );

    constructor() public{ //constructor=������
        // ������ �� ��Ʈ��Ʈ�� ������ �����ϴµ� ���̴� ���� �����̴ٶ�� �����ϴ°�, �� EV���� â���� = ������ �ִ°ǵ�....�о� ��� ���� ���̻���
        owner = msg.sender; // msg.sender�� ���� ����ϴ� �������� �����ڳ� �Լ��� ������ (���� �ּ�����)
    }

    function setCarOwner(string _name, string _carNum, uint _socI, uint _socR){ // �������
        carOwnerInfo[num] = carOwner(msg.sender, _name, _carNum, _socI, _socR);
        setOwnerState(_socI, _socR);
    }

    function setOwnerState(uint _socI, uint _socR){ //�Ǹ���,������,�ϰ͵� ���ϴ³� ����
        if(_socI > _socR){
            sellerList.push(msg.sender);
        } else if(_socI < _socR){
            buyerList.push(msg.sender);
        } else{
            idealList.push(msg.sender);
        }
    }


}

// 1. ȭ�鿡 ���� �̸�, �� ������ ����ϴ� �� ������ �ŷ�Ǯ�� �����Ͻðڽ��ϱ�? �� ����Ŭ���ϸ� �ٷ�
// 2. ���� �Է��ϸ� �ٷ� ���� ȭ������ �ڵ��� ���� ���͸� �뷮�� ���ϴ� ���͸� �뷮 ���� �� ��
//      (���͸��뷮 0~100 ����)
// 3. ���ο��� �˾Ƽ� �Ǹ��� / �����ڷ� ����� ��Ī �̷���� (js����? or sol����?) �׸��� �ŷ���
// 4. �ŷ� �Ϸ� â ("�� kw�� �����Ǿ����ϴ�")
// 5. �ŷ� ����(�ŷ��뷮 �ð� ��¥ ���������) Ȯ�� �Ϸ��� �������������� �� �� ����
