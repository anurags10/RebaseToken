// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {IRebaseToken} from "./interfaces/IRebaseToken.sol";

contract Vault {
    IRebaseToken private immutable i_rebaseToken;

    error Vault__TransferFailed();

    event Deposit(address indexed user, uint256 amount);

    constructor(IRebaseToken _rebaseToken) {
        i_rebaseToken = _rebaseToken;
    }

    receive() external payable {}

    function deposit() external payable {
        i_rebaseToken.mint(msg.sender, msg.value);

        emit Deposit(msg.sender, msg.value);
    }

    function redeem(uint256 _amount) external {
        i_rebaseToken.burn(msg.sender, _amount);
        (bool success,) = payable(msg.sender).call{value: _amount}("");
        if (!success) {
            revert Vault__TransferFailed();
        }
    }

    //getter function

    function getRebaseTokenAddress() external view returns (address) {
        return address(i_rebaseToken);
    }
}
