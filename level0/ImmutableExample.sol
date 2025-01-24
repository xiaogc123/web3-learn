// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 * 常量和不可变量练习
 */
contract ImmutableExample {
    // 常量
    uint256 public constant MAX_SUPPLY = 1000000;
    // 不可变量
    uint256 public immutable INITIAL_SUPPLY = 1000000;
    // 常量不能在构造函数中初始化
    // 不可变量可以在构造函数中初始化
    constructor() {
        // MAX_SUPPLY = 1000000;
        INITIAL_SUPPLY = 1000000;
    }
}