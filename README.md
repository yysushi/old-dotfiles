# Dotfiles

## Dependencies

See [here](./dependencies.md).

And you should install language-speicifc packages from under [packages](./packages).

### Language-specific tools

- Rust

`$ <packages/rustup.txt xargs -I {} rustup component add {}`

- Python

`$ PIP_REQUIRE_VIRTUALENV="" pip install -r packages/pip.txt`

`$ <packages/pipx.txt pipx install {}`

- Golang

`go generate packages/get.go`


## Configurations

Then place your configurations by running install.sh as follows.

```shell-session
./install.sh
```
