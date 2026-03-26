// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ERC20 {
    string public name;
    string public symbol;
    uint8 public constant decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(
        string memory _name,
        string memory _symbol,
        address[] memory _holders,
        uint256[] memory _initialBalances
    ) {
        require(_holders.length == _initialBalances.length, "ERC20: length mismatch");

        name = _name;
        symbol = _symbol;

        for (uint256 i = 0; i < _holders.length; i++) {
            require(_holders[i] != address(0), "ERC20: mint to zero address");
            balanceOf[_holders[i]] += _initialBalances[i];
            totalSupply += _initialBalances[i];
            emit Transfer(address(0), _holders[i], _initialBalances[i]);
        }
    }

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) public returns (bool) {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
        uint256 allowed = allowance[from][msg.sender];
        if (allowed != type(uint256).max) {
            allowance[from][msg.sender] = allowed - value;
        }
        _transfer(from, to, value);
        return true;
    }

    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "ERC20: transfer to zero address");
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
    }
}
