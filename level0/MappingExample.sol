// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
/**
 * 1. 实现一个合约，使用 `mapping` 处理用户输入，并提供键值对的相关操作。
 */
contract MappingExample {
    // 定义一个 mapping
    mapping(uint => string) public data;
    // 定义一个函数，接收键值对作为参数并返回其值
    function getValue(uint key) public view returns (string memory) {
        return data[key];
    }
    // 定义一个函数，接收键值对作为参数并设置其值
    function setValue(uint key, string memory value) public {
        data[key] = value;
    }
    // 定义一个函数，接收键值对作为参数并删除其值
    function deleteValue(uint key) public {
        delete data[key];
    }

    // 定义一个 mapping，用于存储地址和余额
    mapping(address => uint) public balances;
    // 定义一个函数，接收地址作为参数并返回其余额
    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }
    // 定义一个函数，接收地址和余额作为参数并设置其余额
    function updateBalance(uint balance) public {
        require(balance > 0, "Balance must be greater than 0");
        // 更新余额
        balances[msg.sender] = balance;
    }

}
/** 
 * 3. 实现一个合约，用于测试 MappingExample 合约
 * @title MappingUser
 * @author 
 * @notice 
 */
contract MappingUser{
    /**
     * 3.1 实现一个函数，用于测试 MappingExample 合约
     * @notice 
     * @dev 
     * @return 
     */
    function test() public returns (uint){
        // 创建 MappingExample 合约的实例
        MappingExample mappingExample = new MappingExample();
        // 更新 MappingExample 合约中调用者的余额
        address userAddress = address(this); //明确指定用户地址
        uint initialBalance = mappingExample.getBalance(userAddress); //获取初始余额
        mappingExample.updateBalance(100); //更新余额
        uint finalBalance = mappingExample.getBalance(userAddress); //获取最终余额
        // 返回余额变化
        return finalBalance - initialBalance; //返回余额变化，更清晰地展示测试结果
    }
}