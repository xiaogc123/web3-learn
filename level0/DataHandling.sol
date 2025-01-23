// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
contract DataHandling {
    // 存储在storage中的动态数组
    uint[] public data;
    // 将memory中的数组内容复制到storage中的data数组
    function updateData(uint[] memory x) public {
        data = x; // 从memory中复制数组到storage
    }
    // 返回storage中的data数组
    function getData() public view returns (uint[] memory) {
        return data; // 返回storage中的数据作为memory中的数组
    }

    // 修改storage中的data数组中指定索引位置的值
    function modifyData(uint index, uint value) public {
        require(index < data.length, "Index out of bounds"); // 检查索引是否在数组范围内
        data[index] = value; // 修改指定索引位置的值
    }
    // 尝试修改传入的memory数组，并返回修改后的数组
    function modifyMemoryArray(uint[] memory x) public pure returns (uint[] memory) {
        if (x.length > 0) { // 检查数组是否为空
            x[0] = 100; // 修改memory数组中的第一个元素
        }
        return x; // 返回修改后的数组
    }
}