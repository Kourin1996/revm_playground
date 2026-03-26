# Repository Guidelines

## Project Structure & Module Organization
This repository mixes a Rust `revm` playground with a Foundry smart-contract project.

- `src/main.rs`: default Rust entry point for quick experiments.
- `bin/erc20-deploy/main.rs`: standalone Rust binary that deploys and probes the sample ERC-20 in an in-memory EVM.
- `contracts/src/`: Solidity sources, currently including `ERC20.sol`.
- `contracts/test/`: Foundry tests using the `*.t.sol` naming pattern.
- `contracts/script/`: deployment or demo scripts.
- `contracts/lib/forge-std/`: vendored Foundry standard library; avoid editing unless updating the dependency itself.

## Build, Test, and Development Commands
Use the Rust toolchain from the repository root and Foundry commands from `contracts/`.

- `cargo check`: fast validation of Rust code without producing binaries.
- `cargo run`: runs the default Rust playground in `src/main.rs`.
- `cargo run --bin erc20-deploy`: runs the ERC-20 deployment example.
- `cargo test`: runs Rust tests.
- `cargo fmt && cargo clippy --all-targets --all-features`: format and lint Rust changes before opening a PR.
- `cd contracts && forge build`: compiles Solidity contracts.
- `cd contracts && forge test`: runs Foundry tests.
- `cd contracts && forge fmt`: formats Solidity files.

## Coding Style & Naming Conventions
Use 4-space indentation in both Rust and Solidity. Follow default `rustfmt` formatting and keep Rust APIs in `snake_case`, types in `PascalCase`, and constants in `SCREAMING_SNAKE_CASE`. Match Solidity conventions already present: contract names in `PascalCase`, functions/variables in `camelCase`, and test files ending in `.t.sol`.

## Testing Guidelines
Add Rust tests beside the code with `#[cfg(test)]` or in a top-level `tests/` directory if coverage grows. For Solidity, keep tests in `contracts/test/` and name test contracts after the target, for example `ERC20.t.sol`. No coverage gate is configured, so contributors should add tests for new execution paths, state changes, and failure cases.

## Commit & Pull Request Guidelines
Git history uses short, plain-English commit subjects such as `Add ERC20 contract in foundry project`. Keep commits focused and write subjects in the imperative mood. PRs should include a concise summary, the commands you ran (`cargo test`, `forge test`, etc.), and note any RPC, key, or deployment assumptions. Do not commit private keys, RPC secrets, or generated artifacts unless they are intentionally tracked.
