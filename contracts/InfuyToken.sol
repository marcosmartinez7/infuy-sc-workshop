//This is a simple coin-like contract that doesnt satisfies any standard.
//If you want to create a compatible one please check https://github.com/OpenZeppelin/openzeppelin-solidity/tree/master/contracts/token

pragma solidity >=0.4.22 <0.6.0;

contract InfuyToken {

    mapping(address => uint256) balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        balances[msg.sender] = 100;
    }

    function getBalance(address from) view public returns (uint256) {
        return balances[from];
    }

    function transfer(address to, uint256 value) public returns (bool){
       // require(balances[msg.sender] <= value);
        if(balances[msg.sender] < value){
            return false;
        }
        balances[msg.sender] -= value;
        balances[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }

}











