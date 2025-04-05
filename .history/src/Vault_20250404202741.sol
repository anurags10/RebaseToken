// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Vault {
    address private immutable i_rebaseToken;

    event Deposit(address indexed user, uint256 amount);

    constructor(address _rebaseToken) {
        i_rebaseToken = _rebaseToken;
    }

    receive() external payable {}

    function deposit() external payable {
        i_rebaseToken.mint(msg.sender, msg.value);

        emit Deposit(msg.sender, msg.value);
    }

    //getter function

    function getRebaseTokenAddress() external view returns (address) {
        return i_rebaseToken;
    }
}
