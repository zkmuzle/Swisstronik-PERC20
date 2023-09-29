// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

import "./PERC20.sol";

/**
 * @dev Sample implementation of the {PERC20} contract.
 */
contract ZKMUZLE is PERC20 {
    constructor() PERC20("Privy Token", "pSWTR") {
         _mint(msg.sender, 50 * 10 ** decimals());
    }

    /// @dev Wraps SWTR to PSWTR.
    receive() external payable {
        _mint(msg.sender, 50 * 10 ** decimals());
    }

    // this function mint tokens to any address that call this function
    function mint(uint256 _amount) public {
        _mint(msg.sender, _amount * 50 ** decimals());
    }

    // this function is to transfer tokens to any address   
    function transfer(address _to, uint256 _amount) public override returns (bool) {
        _transfer(msg.sender, _to, _amount * 10 ** decimals());
        return true;
    }
}