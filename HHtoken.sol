//from https://enlight.nyc/ethereum-token

pragma solidity ^0.4.4;

contract ERC20Token {

  function totalSupply() constant returns (uint256 supply) {}
  
  function balanceOf(address _owner) constant returns (uint256 balance) {}
  
  function transfer(address _to, uint256 _value) returns (bool success) {}
  
  function transferFrom(address _from, address _to, uint256 _value) returns (bool successs) {}
  
  function approve(address _spender, uint256 _value)returns (bool sucess) {}
  
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}
  
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint _value);
}

contract Token is ERCToken {

  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  uint256 public totalSupply;
  
}
