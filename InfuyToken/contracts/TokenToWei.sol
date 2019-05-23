pragma solidity ^0.4.24;

library TokenToWei{
	function convert(uint amount, uint rate) public pure returns (uint convertedAmount){
		return amount * (10**18) * rate;
	}
}
