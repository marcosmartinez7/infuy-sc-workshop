pragma solidity >=0.4.25 <0.6.0;

import "./TokenToEther.sol";

//This is a simple coin-like contract that doesnt satisfies any standard.
//If you want to create a compatible one please check https://github.com/OpenZeppelin/openzeppelin-solidity/tree/master/contracts/token

contract RskToken {
	mapping (address => uint) balances;

	event Transfer(address indexed _from, address indexed _to, uint256 _value);

	constructor() public {
		balances[msg.sender] = 100;
	}

	function transferTokens(address receiver, uint amount) public returns(bool transfered) {
		if (balances[msg.sender] < amount) return false;
		balances[msg.sender] -= amount;
		balances[receiver] += amount;
		emit Transfer(msg.sender, receiver, amount);
		return true;
	}

	function getBalanceInEth(address addr) public view returns(uint){
		return TokenToEther.convert(getBalance(addr),2);
	}

	function getBalance(address addr) public view returns(uint) {
		return balances[addr];
	}
}
