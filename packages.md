# Language-Specific Tools' Installation

- Rust (rustup): `<packages/rustup.txt xargs -J % rustup component add %`
- Rust (cargo): `<packages/cargo.txt xargs -J % cargo install %`
- Python (pip): `PIP_REQUIRE_VIRTUALENV="" pip install -r packages/pip.txt`
- Python (pipx): `<packages/pipx.txt xargs -I % pipx install %`
- Golang: `go generate packages/get.go`
