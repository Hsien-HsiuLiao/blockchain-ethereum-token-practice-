//from https://enlight.nyc/ethereum-token

pragma solidity ^0.4.4;

contract ERC20Token {

  function totalSupply() constant returns (uint256 supply) {}
  
  function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
  }
  
  function transfer(address _to, uint256 _value) returns (bool success) {
          if (balances[msg.sender] >= _value && _value > 0 {
              balances[msg.sender] -= _value;
              balances[_to] += _value;
              Transfer(msg.sender, _to, _value);
              return true;
          } else {return flase; }
  }
  
  function transferFrom(address _from, address _to, uint256 _value) returns (bool successs) {
      if (balances[_from] >= _value && allowed[_from][msg.sender] >= _value && _value > 0) {
          balances[_to] += _value;
          balances[_from] -= _value;
          allowed[_from][msg.sender] -= _value;
          Transfer(_from, _to, _value);
          return true;
      } else { return false; }
  }
  
  function approve(address _spender, uint256 _value)returns (bool sucess) {
          allowed[msg.sender][_spender] = _value;
          Approval(msg.sender, _spender, _value);
          retrurn true;
  }
  
  function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
          return allowed[_owner][_spender];
  } //end of Token contract
  
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  event Approval(address indexed _owner, address indexed _spender, uint _value);
}

contract Token is ERCToken {

  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) allowed;
  uint256 public totalSupply;
  
}

contract ENLT is Token {

    function () {
        //if ether is sent to this address, send it back.
        throw;
    }
    
    string public name;
    uint8 public decimals;
    string public symbol;
    
    function ENLT( // should have the same name as the contract name
        ) {
        balances[msg.sender] = 1000;    // creator gets all initial tokens
        totalSupply = 1000;             // total supply of token
        name = "Enlight";               // name of token
        decimals = 0;                   // amount of decimals
        symbol = "ENLT";                // symbol of token
    }
    
    /* Approves and then calls the receiving contract */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        
        if(!_spender.call(bytes4(bytes32(sha3("receiveApproval(address, uint256, address, bytes)"))), msg.sender, _value, this, _extraData)) { throw; }
        return true;
    }
}    
      
    
