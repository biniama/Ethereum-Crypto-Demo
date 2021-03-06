pragma solidity ^0.4.0;

contract BinCoin {
    address public creator;
    mapping (address => uint) public balances;
    
    //event that notifies when a transfer has completed
    event Delivered(address from, address to, uint amount);
    
    function BinCoin() {
        creator = msg.sender;
    }
    
    function create(address receiver, uint amount) {
        if (msg.sender != creator) throw;
        balances[receiver] += amount;
    }
    
    function transfer(address receiver, uint amount) {
        if (balances[msg.sender] < amount) throw;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Delivered(msg.sender, receiver, amount);
    }
}
