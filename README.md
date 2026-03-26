# revm_playground

Small playground for experimenting with [`revm`](https://github.com/bluealloy/revm) in Rust, alongside a Foundry subproject for Solidity contracts.

## Rust binaries

### Default binary

Run the default example in [`src/main.rs`](src/main.rs):

```bash
cargo run
```

### ERC-20 deploy example

Run the ERC-20 deployment example in [`bin/erc20-deploy/main.rs`](bin/erc20-deploy/main.rs):

```bash
cargo run --bin erc20-deploy
```

This binary boots an in-memory `revm` instance, deploys the compiled contract from `contracts/src/ERC20.sol`, and prints the deployed contract address plus the initial holder balance.
