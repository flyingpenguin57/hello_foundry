// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Bank} from "../src/Bank.sol";

contract BankTest is Test {
    Bank public bank;
    address private user1;

    function setUp() public {
        bank = new Bank();
        user1 = address(0x123);
        vm.deal(user1, 10 ether);
    }

    function testDepositETH() public {

        // 存款金额
        uint depositAmount = 1 ether;

        // 检查存款事件
        vm.expectEmit(true, true, false, true);
        emit Deposit(user1, depositAmount);

        // 使用user1执行存款
        vm.prank(user1);
        bank.depositETH{value: depositAmount}();

        // 验证balance更新
        assertEq(bank.balanceOf(user1), depositAmount);

        // 验证合约账户余额
        assertEq(address(bank).balance, depositAmount);

        // 验证user1账户余额减少
        assertEq(user1.balance, 10 ether - depositAmount);
    }

    // 存款事件
    event Deposit(address indexed user, uint amount);
}
