pragma solidity ^0.4.24;

import "./OracleBase.sol";
import "zeppelin-solidity/contracts/ownership/Ownable.sol";
import "zos-lib/contracts/migrations/Migratable.sol";

contract BasicOracle is Migratable, OracleBase, Ownable {

  address public dataSource;

  function initialize(address _dataSource) public isInitializer("BasicOracle", "0.0.0") {
    dataSource = _dataSource;
  }

  function setResult(bytes32 _result) public {
    require(msg.sender == dataSource, "The caller is not the data source.");
    _setResult(_result);
  }

}
