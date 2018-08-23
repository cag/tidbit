# Tidbit

[![NPM Package](https://img.shields.io/npm/v/tidbit-contracts-zos.svg?style=flat-square)](https://www.npmjs.org/package/tidbit-contracts-zos)

A library for oracles on Ethereum.

```
zos link tidbit-contracts-zos
```

### Setup

Install ZeppelinOS globally: `npm install --global zos`

Then run `npm install`

`chmod +x ./scripts/**` to grant execute permissions to the scripts directory

### Compile

Recompile contracts and build artifacts.

```
$ npm run compile
```

### ZeppelinOS

Push contracts to a network
```
zos push --network development
```

Link the Tidbit library to another project
```
zos link tidbit-contracts-zos
```

### Test

Run `yarn compile` before first test run, and after any changes to the `.sol` files

```
$ npm test
```

Run `npm run test:coverage` to run with coverage reporting

### Contracts

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
