// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

// Inherit from Ownable contract
contract Assignment9 is Ownable {
    // Create a public array to store contract addresses
    address[] public deployedContracts;

    // Call Ownable constructor from OpenZeppelin
  constructor(address initialOwner) Ownable(initialOwner) {}


    // Factory function to deploy new instances of `SimpleContract`
    function createContract(uint256 initialValue) external onlyOwner {
        SimpleContract newContract = new SimpleContract(initialValue);
        deployedContracts.push(address(newContract)); // Store deployed contract address
    }
}

// Simple contract to be deployed by the factory
contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}
