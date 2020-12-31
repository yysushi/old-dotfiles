# Language-Specific Tools' Installation

- Golang: `go generate packages/get.go`
- Python (pip): `PIP_REQUIRE_VIRTUALENV="" pip install -r packages/pip.txt`
- Python (pipx): `<packages/pipx.txt xargs -I % pipx install %`
- Rust (cargo): `<packages/cargo.txt xargs -J % cargo install %`
- Rust (rustup): `<packages/rustup.txt xargs -J % rustup component add %`
