// SPDX-License-Identifier: MIT

import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Script} from "forge-std/Script.sol";

pragma solidity 0.8.19;

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}
