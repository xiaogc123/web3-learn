// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
// 定义一个合约，用于处理函数选择器
contract FunctionSelectorExample {
    // 定义选择器状态变量
    bytes4 storedSelector;
    // 计算输入值的平方
    function square(uint a) public pure returns (uint){
        return a * a;
    }
    // 计算输入值的两倍 
    function double(uint x) public pure returns (uint){
        return x + x;
    }
    // 根据传入的选择器动态调用 square 或 double 函数
    function executeFunction(bytes4 selector,uint x) public returns (uint){
        (bool success,bytes memory data ) = address(this).call(abi.encodeWithSelector(selector,x));
        require(success,"Call failed");
        return abi.decode(data,(uint));
    }
    // 将选择器存储在状态变量 storedSelector 中
    function storeSelector(bytes4 selector) public   {
        storedSelector = selector;
    }
    // 调用存储在 storedSelector 中的函数，并返回结果
   
    function executeStoredFunction(uint x) public   returns (uint){
        require(storedSelector != bytes4(0),"No selector stored");
        (bool success,bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(success,"Call failed");
        return abi.decode(data, (uint));
    }

     // 获取指定函数选择器
    function getSquareSelector() public pure returns (bytes4) {
        return bytes4(keccak256("square(uint256)"));
    }
    // 获取指定函数选择器
    function getDoubleSelector() public pure returns (bytes4) {
        return bytes4(keccak256("double(uint256)"));
    }
   
}