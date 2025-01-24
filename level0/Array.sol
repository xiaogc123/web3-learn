// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
/**
 *   1. 编写合约，允许用户动态管理一个地址数组。
 *   2. 实现一个函数，接收数组作为参数并返回其元素之和。
 *   3. 创建一个函数，删除数组中的特定元素并调整数组长度。
 * @title Array 数组处理合约
 * @author xiaogc
 */
contract Array {
    // 定义一个数组
    uint[] public data;
    // 定义一个函数，接收数组作为参数并返回其元素之和
    function sum(uint[] memory x) public pure returns (uint) {
        uint sumData = 0;
        for (uint i = 0; i < x.length; i++) {
            sumData += x[i];
        }
        return sumData;
    }
    // 定义一个函数，删除数组中的特定元素并调整数组长度
    function deleteElement(uint index) public {
        require(index < data.length, "Index out of bounds");
        // 从指定索引开始，将后面的元素向前移动
        for (uint i = index; i < data.length - 1; i++) {
            data[i] = data[i + 1];
        }
        // 删除最后一个元素
        data.pop();
    }

}