pragma solidity ^0.4.24;

import "./OracleBase.sol";
import "zos-lib/contracts/migrations/Migratable.sol";

contract BasicOracle is Migratable, OracleBase {

  address public dataSource;

  function initialize(address _dataSource) public isInitializer("BasicOracle", "0.1.0") {
    dataSource = _dataSource;
  }

  function setResult(bytes32 _result) public {
    require(msg.sender == dataSource, "The caller is not the data source.");
    _setResult(_result);
  }

}
