//SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract MyCroptoToken {
    string public NAME ="Blockchain Devs";
    string public SYMBOL = "BDEV";

    mapping(address => uint) balances;
    address deployer;

    constructor(){
        deployer = msg.sender;
        balances[deployer] = 1000000 * 1e8;
    }

    function name() public view returns(string memory){
        return NAME;
    }

    function symbol() public view returns (string memory){
        return SYMBOL;
    }

    function decimal() public pure returns (uint){
        return 18;

    }

    function balanceOf(address _owner) public view returns(uint) {
        return balances[_owner];

    }

    function tranfer(address _to, uint _amount) public {
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    require(_value <= allowance[_from][msg.sender]);     
    allowance[_from][msg.sender] -= _value;
    _transfer(_from, _to, _value);
    return true;

    mapping(address => mapping(address => uint)) allowances;

    function approve(address _spender, uint _value)public  returns (bool success){
        allowance[msg.sender][_spender]=_value;
        emit Approval(msg.sender,_spender,_value);
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
         return allowed[_owner][_spender];
    }
    
    function increaseAllowance(address spender, uint256 addedValue) public  virtual returns (bool) {
        _approve( _msgSender(), spender, _allowances[_msgSender()][spender] + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = _allowances[_msgSender()][spender];
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero" );
        unchecked {
            _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        }
        return true;
    }
    
}