pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./StandardToken.sol";

contract AgaveCoin is Ownable, StandardToken {


    string public name = "AgaveCoin";
    string public symbol = "AGVC";
    uint public decimals = 18;

    uint public totalSupply = 35000 * (10**6) * (10**18); // 35 Billion

    constructor () public {
        balances[msg.sender] = 23100 * (10**6) * (10**18);                                //Public
        balances[0xe646a5C60FaA64A6B8146210b2C71DD0968b7023] = 3150 * (10**6) * (10**18); //Partners
        balances[0x9283851FF7F8a57eDeF02e72972A970Fe0F25a98] = 1750 * (10**6) * (10**18); //Team and Advisers
        balances[0xd5D235e12Dec85E35D549a7856F96B3ce00e0885] = 2100 * (10**6) * (10**18); //Private Sale
        balances[0x08a2a6fB377137B71474B8D6a20575EA1E5396AE] = 4900 * (10**6) * (10**18); //Reserve
    }

    function () public {
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        balances[_newOwner] = balances[owner].add(balances[_newOwner]);
        balances[owner] = 0;
        Ownable.transferOwnership(_newOwner);
    }

    function transferAnyERC20Token(address tokenAddress, uint amount) public onlyOwner returns (bool success) {
        return ERC20(tokenAddress).transfer(owner, amount);
    }
}