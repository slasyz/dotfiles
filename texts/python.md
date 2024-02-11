# Python tools


## Basic

```shell
brew install ipython      # ipython
brew install virtualenv   # virtualenv
brew install pyenv        # Python versions manager
brew install pipx         # install Python apps in isolated environments
```


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
