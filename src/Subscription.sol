// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;

contract Subscription {
    uint256 cost = 1 ether;
    address public owner;
    mapping (address => uint256) subscribers;

    constructor() {
        // when the contract is created the owner is the one who deployed it. 
        owner = msg.sender;
    }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function payForSubscription() public payable {
        require(msg.value >= cost);
        subscribers[msg.sender] = msg.value;
    }

    modifier auth {
        require (msg.sender == owner);
        _;
    }

    function getMoneyToTheOwner() public auth {
        payable(msg.sender).transfer(payable(address(this)).balance);
    }

    function getMoneyBack() public {
        // this not secure yet. We will see in the coming issue what's wrong. No worries for now.
        payable(msg.sender).transfer(subscribers[msg.sender]);
    }
}