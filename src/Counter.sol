// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract SimpleVault {
    
    mapping(address => uint256) public balances;

    event Deposited (address indexed user, uint256 amount);

    event Withdrawn (address indexed user, uint256 amount);

    function deposit() external payable {
        require(msg.value > 0, "No Avax Sent");

        balances[msg.sender] += msg.value;

        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 amount) external {
        require(amount > 0, "Amount must be greayer than 0");

        require(
            balances[msg.sender]>= amount,
            "Not enough balance"
        );

        balances[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{
            value: amount
        } ("");

        require(success, "AVAX Transfer Failed");

        emit Withdrawn(msg.sender, amount);
        
    }
}
