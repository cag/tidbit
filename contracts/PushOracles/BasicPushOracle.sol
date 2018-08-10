pragma solidity ^0.4.24;

import "./PushOracleBase.sol";
import "../BasicOracle.sol";

contract BasicPushOracle is BasicOracle, PushOracleBase {

  function initialize (
    address _dataSource,
    IOracleHandler _handler
  )
    public
    isInitializer("BasicPushOracle", "0.1.3")
  {
    BasicOracle.initialize(_dataSource);
    PushOracleBase.initialize(_handler, 0);
  }

}
