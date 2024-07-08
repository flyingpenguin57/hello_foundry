// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/MyToken.sol";

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();
        
        // 部署你的合约
        MyToken myToken = new MyToken("LIQINGHAO","LIQINGHAO");
        
        vm.stopBroadcast();
    }
}
