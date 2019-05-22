pragma solidity >=0.4.25 <0.6.0;

library TokenToEther{
	function convert(uint amount,uint rate) public pure returns (uint convertedAmount){
		return amount * rate;
	}
}
