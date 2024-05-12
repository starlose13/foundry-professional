// SPDX-License-Identifier: MIT

pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    DeployFundMe deployFundMe;
    address USER = makeAddr("new User");

    function setUp() external {
        deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(USER, 100 ether);
    }

    function testMinimumFive() public {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOnwer() public {
        console.log(msg.sender);
        console.log(fundMe.getOwner());
        assertEq(fundMe.getOwner(), msg.sender);
    }

    function testGetVersion() external {
        assertEq(fundMe.getVersion(), 4);
    }

    function testFund() external {
        vm.expectRevert();
        fundMe.fund();
        vm.prank(USER);
        fundMe.fund{value: 10 ether}();
        console.log(USER);
        console.log(USER.balance);
    }

    function testOnlyOnwerAccess() public {
        vm.expectRevert();
        hoax(USER, 100);
        fundMe.withdraw();
        vm.prank(fundMe.getOwner());
        fundMe.withdraw();
    }
}
