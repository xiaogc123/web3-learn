// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * 1. 编写一个合约，定义不同的可见性修饰符并测试其访问权限。
 * 2. 实现一个事件触发的功能，外部应用可以通过 Web3.js 监听事件。
 * 3. 编写一个带有 `receive` 和 `fallback` 函数的合约，测试其接收以太币和处理错误调用的行为
 */
contract MixedExample {

    // 定义一个事件，用于记录存款信息
    event Deposit(address indexed sender, uint256 amount);
    // 定义一个函数，用于接收以太币
    receive() external payable {}
    // 定义一个函数，用于处理错误调用
    fallback() external payable {}

}