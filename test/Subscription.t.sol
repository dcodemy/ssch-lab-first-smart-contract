// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Subscription} from "../src/Subscription.sol";

contract SubscriptionTest is Test {
    Subscription public s;
    address public owner;
    address public bob; // bob is a subscriber

    function setUp() public {
        owner = address(0x123);
        bob = address(0x456);
        vm.deal(owner, 10 ether);
        vm.deal(bob, 10 ether);
        vm.prank(owner);
        s = new Subscription();
      
    }

    //1. Only the creator of the contract can receive funds.
    function test_only_owner_can_receive_funds() public {
        // Check that owner is the owner of the Subscription contract
        assertEq(s.owner(), owner);
        // Check that bob is not the owner of the Subscription contract
       
        // Impersonate bob
        
        // Bob pays for the subscription 
        
    
        // Verify that when Bob tries to steal all the funds calling getMoneyToTheOwner, it reverts
        
        
        
        // Stop impersonating bob
       
        // Start impersonating owner
       
        // Call the function getMoneyToTheOwner as the owner
       
        // Stop impersonating owner
       
        // Check that the owner received the funds and the address is the owner of the contract.
        assertEq(payable(owner).balance, 11 ether);
        assertEq(payable(bob).balance, 9 ether);
        assertEq(owner, s.owner());
    }
    
    //The subscription can be bought by only paying the requested amount.
    function test_subscription_cant_be_bought_by_paying_less_than_the_requested_amount() public {
        
        vm.startPrank(bob);
        vm.expectRevert();
        // check that the require(msg.value >= cost); is working and it 
        //reverts the transaction if the value is less than the cost.
        
        vm.stopPrank();
        
        
    }

    function test_users_can_only_receive_their_ether_back() public{

        vm.startPrank(bob);

        // add instructions here

        vm.expectRevert();
        s.getMoneyBack();
        vm.stopPrank();
        
    }
}
