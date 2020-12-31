# Language-specific tools

## Installation

- Rust

`<packages/rustup.txt xargs -J % rustup component add %`

`<packages/cargo.txt xargs -J % cargo install %`

- Python

`PIP_REQUIRE_VIRTUALENV="" pip install -r packages/pip.txt`

`<packages/pipx.txt xargs -I % pipx install %`

- Golang

`go generate packages/get.go`
