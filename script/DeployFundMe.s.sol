// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    FundMe public fundMe;

    function run() external returns (FundMe) {
        HelperConfig helperConfig = new HelperConfig();
        (address currentActiveNetwork, ) = helperConfig.activated();
        vm.startBroadcast();
        fundMe = new FundMe(currentActiveNetwork);
        vm.stopBroadcast();
        return fundMe;
    }
}
