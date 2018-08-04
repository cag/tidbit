import { web3 } from '../helpers/w3'

const SignedPushOracle = artifacts.require('SignedPushOracle')
const OracleHandlerMock = artifacts.require('OracleHandlerMock')

require('chai').should()

const RESULT = 'hello oracle'
const RESULT_HASH = web3.utils.soliditySha3(RESULT);

contract('SignedPushOracle', (accounts) => {
  const signer = accounts[1]

  it('calls receiveResult() on OracleHandler', async () => {
    // Deploy contracts
    const oracleHandler = await OracleHandlerMock.new()
    const oracle = await SignedPushOracle.new()
    await oracle.initialize(signer, oracleHandler.address)

    // Sign and set result hash
    let signature = await web3.eth.sign(RESULT_HASH, signer)
    await oracle.setResult(RESULT_HASH, signature)

    // Get result from oracle handler
    const result = await oracleHandler.result()
    result.should.equal(RESULT_HASH)
  })
})
