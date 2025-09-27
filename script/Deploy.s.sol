// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "forge-std/Script.sol";
import "../src/SimpleStorage.sol";

contract DeployScript is Script {
    function run() external {
        vm.startBroadcast();
        
        The4thMatter deployedContract = new The4thMatter("Hello, Plasma");        
        vm.stopBroadcast();
        
        console.log("The4thMatter deployed to:", address(deployedContract));
    }
}