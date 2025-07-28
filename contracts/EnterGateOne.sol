pragma solidity ^0.8.0;

contract entering{
 
function unlock(uint256 gas) external returns (bool sent){
address gatekeeper = 0x571b136e6817f4f24a3441DDC79BA0b743d805CE;
bytes8 key = bytes8(uint64(uint160(address(msg.sender)))) & 0xFFFFFFFF0000FFFF;

(bool success,)= gatekeeper.call{gas:gas}(abi.encodeWithSignature("enter(bytes8)", key));
require(success);
return true;
}
}