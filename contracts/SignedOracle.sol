pragma solidity ^0.4.24;

import "./BasicOracle.sol";
import "zeppelin-solidity/contracts/ECRecovery.sol";

contract SignedOracle is BasicOracle {

  function initialize(
    address _dataSource
  )
    public
    isInitializer("SignedOracle", "0.1.4")
  {
    BasicOracle.initialize(_dataSource);
  }

  function setResult(bytes32 _result, bytes _signature) public {
    // Generate message hash
    bytes memory prefix = "\x19Ethereum Signed Message:\n32";
    bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, _result));

    // Recover signer from the signature with messageSigned
    address signer = ECRecovery.recover(prefixedHash, _signature);

    // Check that the signer is the dataSource
    require(signer == dataSource, "Invalid signature");

    _setResult(_result);
  }

}
