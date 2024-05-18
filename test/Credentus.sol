// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Credentus} from "../src/Credentus.sol";

contract CredentusTest is Test {
    Credentus public credentus;

    error TransferSoulbound();

    function setUp() public {
        credentus = new Credentus();
    }

    function testMint() external {
        credentus.mintToken(address(10), "");
        assertEq(credentus.tokenURI(0), "");
    }

    function testTransfer() external {
        credentus.mintToken(address(this), "");
        vm.expectRevert(TransferSoulbound.selector);
        credentus.transferFrom(address(this), address(10000), 0);
    }
}
