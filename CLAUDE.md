# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Build
cargo build

# Run
cargo run

# Test
cargo test

# Run a single test by name
cargo test <test_name>

# Check without building
cargo check

# Lint
cargo clippy
```

## Project

This is a Rust playground project (`revm_playground`) for experimenting with [revm](https://github.com/bluealloy/revm), a Rust implementation of the Ethereum Virtual Machine. The project is currently bootstrapped with a minimal `src/main.rs` and no dependencies yet.

Add revm as a dependency in `Cargo.toml` to start experimenting:

```toml
[dependencies]
revm = "..."
```
