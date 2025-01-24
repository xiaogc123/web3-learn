// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * 1. 创建一个合约，使用 `timeLock` 机制，实现一个多阶段时间锁。
 * 2. 在合约中实现一个 `timeLock` 机制，使得在特定时间之前无法执行某些操作。
 * 3. 使用 `timeLock` 机制，实现一个多阶段时间锁，使得在特定时间之前无法执行某些操作。
 */
contract MultiStageTimeLock {
    uint public stage1UnlockTime; 
    uint public stage2UnlockTime; 
    address public owner;
    constructor(uint _stage1UnlockTime, uint _stage2UnlockTime) {
        owner = msg.sender;
        stage1UnlockTime = block.timestamp + _stage1UnlockTime * 1 days;
        stage2UnlockTime = block.timestamp + _stage2UnlockTime * 1 days;
    }
    // 定义一个函数，用于设置阶段1的解锁时间
    function setStage1UnlockTime(uint _time) public {
        require(block.timestamp < stage1UnlockTime, "Stage 1 is already unlocked");
        require(msg.sender == owner, "Only owner can set stage 1 unlock time");
        stage1UnlockTime = block.timestamp + _time * 1 days;
    }
    // 定义一个函数，用于设置阶段2的解锁时间
    function setStage2UnlockTime(uint _time) public {
        require(block.timestamp < stage2UnlockTime, "Stage 2 is already unlocked");
        require(msg.sender == owner, "Only owner can set stage 2 unlock time");
        stage2UnlockTime = block.timestamp + _time * 1 days;
    }
}