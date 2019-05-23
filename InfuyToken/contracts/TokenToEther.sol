pragma solidity ^0.4.24;

library TokenToEther{
	function convert(uint amount,uint rate) public pure returns (uint convertedAmount){
		return amount * rate;
	}
}
