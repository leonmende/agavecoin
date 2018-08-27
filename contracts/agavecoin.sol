contract AgaveCoin is Ownable, StandardToken {
  using SafeMath for uint256;

    string public name = "AgaveCoin";
    string public symbol = "AGVC";
    uint public decimals = 18;

    uint public INITIAL_SUPPLY = 35000 * (10**6) * (10 ** uint256(decimals)) ; // 35 Billion
    
    /// The owner of this address:
    address public PartnersAddress = 0x3Ab66540262C3a35651B532FdcCaB59805Eb6d8B;

    /// The owner of this address:
    address public TeamAddress = 0x9CDeA5dec3082ae7b8a58eb5E99c57876484f7A1;
    
    /// The owner of this address:
    address public PrivateSaleAddress = 0x6690D262AB9848e132aaa9E25995e40949A497E0;    
    
    /// The owner of this address:
    address public ReserveAddress = 0x40A6B86726e4003e3e72E3e70A8c70534938881D;

    uint256 PartnersTokens = 2450 * (10**6) * (10**uint256(decimals));
    uint256 TeamTokens = 1750 * (10**6) * (10**uint256(decimals));
    uint256 PrivateSaleTokens = 2450 * (10**6) * (10**uint256(decimals));
    uint256 ReserveTokens = 5250 * (10**6) * (10**uint256(decimals));

    constructor () public {
      totalSupply_ = INITIAL_SUPPLY;
      balances[PartnersAddress] = PartnersTokens; //Partners
      balances[TeamAddress] = TeamTokens; //Team and Advisers
      balances[PrivateSaleAddress] = PrivateSaleTokens; //Private Sale
      balances[ReserveAddress] = ReserveTokens; //Reserve
      balances[msg.sender] = INITIAL_SUPPLY - PartnersTokens - TeamTokens - PrivateSaleTokens - ReserveTokens;

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