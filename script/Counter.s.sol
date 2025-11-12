// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import {SimpleVault} from "../src/Counter.sol";

contract SimpleVaultScript is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerKey);

        SimpleVault vault = new SimpleVault();

        vm.stopBroadcast();

        console2.log("SimpleVault deployed at:", address(vault));
    }
}
