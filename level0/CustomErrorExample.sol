// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * 1. 创建一个自定义错误，用于在合约中抛出错误。
 * 2. 在合约中使用自定义错误，并测试其功能。
 */
contract CustomErrorExample {
    // 定义一个自定义错误
    error InsufficientBalance(address caller);
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    // 定义一个函数，用于检查余额是否足够
    function checkBalance() public view {
        if (msg.sender != owner) {
            revert InsufficientBalance(msg.sender);
        }
    }

}