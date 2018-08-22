# Tidbit

A library for oracles on Ethereum.

#### Inheritance Tree

```
IOracle
   |
   v
OracleBase --------> BasicOracle ------> SignedOracle
   |                      |                   |
   v                      v                   v
PushOracleBase --> BasicPushOracle --> SingedPushOracle
```

### Setup

Install ZeppelinOS globally: `npm install --global zos`

Then run `yarn install`

`chmod +x ./scripts/**` to grant execute permissions on the scripts directory

### Compile

Recompile contracts and build artifacts.

```
$ yarn compile
```

### ZeppelinOS

Push contracts to a network
```
zos push --network development
```

Create a new instance of a contract
```
zos create BasicOracle --init initialize --args DATA_SOURCE_ACCOUNT --network development
```

Upgrade a contract - First, push updated contracts `zos push --network development`

```
zos update BasicOracle --network development
```

Link the Tidbit library
```
zos link tidbit-contracts-zos
```

### Test

Run `yarn compile` before first test run, and after any changes to the `.sol` files

```
$ yarn test
```

Run `yarn test:coverage` to run with coverage reporting
