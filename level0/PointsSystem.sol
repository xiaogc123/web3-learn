// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
/**
 * 1. 基于映射创建一个简单的用户余额管理系统，并实现余额的增加与查询功能。
 * 2. 扩展系统，使其能够记录每个用户的交易历史，模拟 Java 的 `Map` 中键集合的概念。
 * 3. 结合映射与数组，实现一个简单的排行榜系统，记录并排序用户的积分。
 */
contract PointsSystem {
    // 定义一个 mapping，用于存储用户的积分
    mapping(address => uint) public points;
    // 定义一个
    address[] public users;
    // 定义一个 mapping，用于存储用户的交易历史
    function addUser(address _user) public {
        require(points[_user] == 0, "User already exists");
        points[_user] = 100; // 初始化用户积分为100
        users.push(_user);
    }
    // 定义一个函数，用于增加用户的积分
    function addPoints(address user, uint amount) public {
        points[user] += amount;
        users.push(user);
    }
    // 定义一个函数，用于转移积分
    function transferPoints(address _to, uint _amount) public{
        require(points[msg.sender]>_amount,"Insufficient points.");
        points[msg.sender] -= _amount;
        points[_to] += _amount;
    }
    // 定义一个函数，用于获取所有用户
    function getAllUsers()public view returns(address[] memory){
        return users;
    }
}