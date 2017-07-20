pragma solidity ^0.4.4;

contract Balance{

 uint public amount;

 function Balance(uint _amount){
 	amount = _amount;
 }	

 function withDrawAmount(uint _amount){
 	amount = -_amount;
 }

 function addAmount(uint _amount){
 	amount = +_amount;
 }
}