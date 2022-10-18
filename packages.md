# Language-Specific Tools' Installation

- Golang: `go generate packages/install.go`
- Python (pipx): `<packages/pipx.txt xargs -I % pipx install %`
- Rust (cargo): `<packages/cargo.txt xargs -I % cargo install %`
- Rust (rustup): `<packages/rustup.txt xargs -I % rustup component add %`
