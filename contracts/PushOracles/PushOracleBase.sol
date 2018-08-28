pragma solidity ^0.4.24;

import "./IOracleHandler.sol";
import "../OracleBase.sol";
import "zos-lib/contracts/migrations/Migratable.sol";

contract PushOracleBase is Migratable, OracleBase {

  IOracleHandler public handler;

  function initialize(IOracleHandler _handler) public isInitializer("PushOracleBase", "0.1.4") {
    handler = _handler;
  }

  /*
   *  Internal functions
   */

  function _resultWasSet(bytes32 _result) internal {
    super._resultWasSet(_result);
    handler.receiveResult(0, _result);
  }

}
