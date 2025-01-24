// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;
/**
 * 函数可见性练习
 */
contract VisibilityExample {
    // 公共变量
    string public publicVar = "publicVar";
    // 私有变量
    string private privateVar = "privateVar";
    // 外部变量
    string externalVar = "externalVar";
    // 内部变量
    string internalVar = "internalVar";
    // 公共函数
    function getPublicVar() public view returns (string memory) {
        return publicVar;
    }
    // 私有函数
    function getPrivateVar() private view returns (string memory) {
        return privateVar;
    }
    // 外部函数
    function getExternalVar() external view returns (string memory) {
        return externalVar;
    }
    // 内部函数
    function getInternalVar() internal view returns (string memory) {
        return internalVar;
    }
    // 声明函数只能读取状态变量，不能修改状态
    function getData() public view returns (string memory) {
        return publicVar;
    }
    // 声明函数既不能读取也不能修改状态变量
    function addData(uint _a, uint _b) public pure returns (uint) {
        // 不能修改状态变量
        return _a + _b;
    }
    // 声明函数能读取不能修改状态变量
    function getData2() public view returns (string memory) {
        return publicVar;
    }

    // 创建一个 `payable` 函数，允许用户向合约发送以太币，并记录发送金额
    uint256 public balance; // 添加一个公共变量来存储合约的余额
    // 定义一个事件，用于记录存款信息
    function deposit() public payable {
        // 向合约发送以太币
        balance += msg.value; // 更新合约余额
        // 记录发送金额  可以考虑添加事件记录，方便追踪
        emit Deposit(msg.sender, msg.value); // 发射一个事件，记录存款信息
    }

    // 定义一个事件，用于记录存款信息
    event Deposit(address indexed sender, uint256 amount);
}
