pragma solidity ^0.5.2;
import "./Ownable.sol";
import "./ERC20Burnable.sol";
import "./SafeMath.sol";

contract AgaveCoin is Ownable, ERC20Burnable {
  using SafeMath for uint256;

    string public name = "AgaveCoin";
    string public symbol = "AGVC";
    uint public decimals = 18;

    uint public INITIAL_SUPPLY = 35000 * (10**6) * (10 ** uint256(decimals)) ; // 35 Billion
    

    /// The owner of this address:
    address public ICOAddress = 0xFd167447Fb1A5E10b962F9c89c857f83bfFEB5D4;
    
    /// The owner of this address:
    address public AgaveCoinOperations = 0x88Ea9058d99DEf4182f4b356Ad178AdCF8e5D784;    
    

    uint256 ICOAddressTokens = 25550 * (10**6) * (10**uint256(decimals));
    uint256 AgaveCoinOperationsTokens = 9450 * (10**6) * (10**uint256(decimals));


    constructor () public {
      totalSupply_ = INITIAL_SUPPLY;
      balances[ICOAddress] = ICOAddressTokens; //Partners
      balances[AgaveCoinOperations] = AgaveCoinOperationsTokens; //Team and Advisers
      balances[msg.sender] = INITIAL_SUPPLY - ICOAddressTokens - AgaveCoinOperationsTokens;

    }
    //////////////// owner only functions below

    /// @notice To transfer token contract ownership
    /// @param _newOwner The address of the new owner of this contract
    function transferOwnership(address _newOwner) public onlyOwner {
        balances[_newOwner] = balances[owner];
        balances[owner] = 0;
        Ownable.transferOwnership(_newOwner);
    }

}