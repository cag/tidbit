const PushOracleBase = artifacts.require('PushOracleBase')

require('chai').should()

contract('PushOracleBase', (accounts) => {
  const handler = accounts[2]

  it('is initialized with the correct state', async () => {
    const oracle = await PushOracleBase.new(handler)
    // oracle.initialize(handler, 0)
    // const handler = await oracle.handler()
    // handler.should.equal(handler)
  })

})
