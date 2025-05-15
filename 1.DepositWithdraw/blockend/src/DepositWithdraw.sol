// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

contract DepositWithdraw {
    mapping(address => uint256) public balance;

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) external {
        require(balance[msg.sender] >= amount, "Not enough balance");
        balance[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
