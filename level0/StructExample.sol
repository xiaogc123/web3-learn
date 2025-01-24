// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
/**
 *  1：创建一个合约，定义一个结构体用于存储产品信息，包括产品 ID、名称、价格和库存。实现增加、修改和查询产品信息的功能。
 *  2：扩展合约，定义一个结构体用于存储订单信息，并实现订单的创建和查询功能，考虑如何设计结构体以便有效存储和访问订单数据。
 *  3：设计一个用户管理合约，使用结构体记录用户的个人信息、余额及交易历史，探索如何优化结构体的设计以减少存储成本。
 */
contract StructExample {
    // 定义一个结构体用于存储用户信息
    struct User {
        string name;
        // 余额
        uint balance;
        // 交易历史
        uint[] transactionHistory;
    }
    // 定义一个结构体用于存储产品信息，包括产品 ID、名称、价格和库存
    struct Product {
        // 产品ID
        uint id;
        // 产品名称
        string name;
        // 产品价格
        uint price;
        // 产品库存
        uint stock;
    }
    // 定义一个结构体用于存储订单信息
    struct Order{
        // 订单ID
        uint id;
        // 买家
        address buyer;
        // 产品ID
        uint productId;
        // 数量
        uint quantity;
        // 总价
        uint totalPrice;
    }
    // 定义一个映射用于存储产品信息
    mapping(uint => Product) public products;
    // 定义一个映射用于存储订单信息
    mapping(uint => Order) public orders;
    // 定义一个映射用于存储用户信息
    mapping(address => User) public users;
    // 产品数量
    uint public productCount;
    // 订单数量
    uint public orderCount;
    // 增加产品信息
    function addProduct(string memory _name, uint _price, uint _stock) public {
        productCount++;
        products[productCount] = Product(productCount, _name, _price, _stock);
        
    }
    // 修改产品信息
    function updateProduct(uint _productId,  uint _stock) public {
        Product storage product = products[_productId];
        product.stock = _stock;
    }
    // 查询产品信息
    function getProduct(uint _productId) public view returns (uint, string memory, uint, uint) {
        Product storage product = products[_productId];
        return (product.id, product.name, product.price, product.stock);
    }
    // 增加订单信息
    function addOrder(uint _productId, uint _quantity, uint _totalPrice) public {
        orderCount++;
        orders[orderCount] = Order(orderCount, msg.sender, _productId, _quantity, _totalPrice);
    }
    // 查询买家订单信息
    function getOrder(uint _id) public view returns (uint, address, uint, uint, uint) {
        Order storage order = orders[_id];
        require(order.buyer == msg.sender, "Not your order"); // 添加权限校验
        return (order.id, order.buyer, order.productId, order.quantity, order.totalPrice);
    }
}
