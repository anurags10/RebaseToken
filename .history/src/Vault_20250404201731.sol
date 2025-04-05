// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Vault {
    address private immutable i_rebaseToken;

    constructor(address _rebaseToken) {
        i_rebaseToken = _rebaseToken;
    }

    receive() external payable {}

    //getter function

    function getRebaseTokenAddress() external view returns (address) {
        return i_rebaseToken;
    }
}
