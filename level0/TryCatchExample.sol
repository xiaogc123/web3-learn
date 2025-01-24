// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/**
 *  1. 编写一个合约，使用 `assert`、`require` 和 `revert` 来处理输入参数和内部逻辑错误。
 *  2. 在合约中实现 `try/catch` 结构，捕获外部合约调用中的异常，并返回处理结果。
 *  3. 使用 Solidity 0.8.0 的自定义错误机制重构错误处理逻辑，减少 Gas 消耗。
 */
contract TryCatchExample {
    ExternalContract externalContract;
    constructor() {
        externalContract = new ExternalContract();
    }
    // 定义一个函数，用于抛出错误
    function willRevert() public pure returns (string memory) {
        revert("Error");
    }
    // 定义一个函数，用于捕获错误
    function catchError() public view returns (string memory) {
        try this.willRevert() {
            // 如果成功，则执行以下代码
            return "Success";
        } catch (bytes memory reason) {
            // 如果失败，则执行以下代码
            return string(reason);
        }
    }
    // 调用外部合约
    function callExternalContract() public view returns (string memory) {
        try externalContract.throwError() returns (string memory reason) {
            return reason;
        } catch (bytes memory reason) {
            return string(reason);
        }
    }
}
contract ExternalContract {
    function throwError() public pure returns (string memory) {
        revert("Error");
    }
    
}