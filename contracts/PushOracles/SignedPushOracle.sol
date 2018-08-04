pragma solidity ^0.4.24;

import "./PushOracleBase.sol";
import "../SignedOracle.sol";

contract SignedPushOracle is SignedOracle, PushOracleBase {

  function initialize (
    address _dataSource,
    IOracleHandler _handler
  )
    public
    isInitializer("BasicPushOracle", "0.0.0")
  {
    SignedOracle.initialize(_dataSource);
    PushOracleBase.initialize(_handler, 0);
  }

}
