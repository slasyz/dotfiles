# Python tools

## pipx

`pipx` is a tool to install and run Python applications (such as Poetry or Invoke) in isolated environments.

```shell
brew install pipx
pipx ensurepath  # or add ~/.local/bin to $PATH manually wherever you set it
```


## Poetry

Install:

```shell
pipx install poetry
```


## Invoke

Invoke runs commands from `tasks.py` in current working directory, just like `make`.

```shell
pipx install invoke
pipx inject invoke fabric
```
