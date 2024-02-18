# Console Apps

## Shell utils

On Mac:

```shell
# Base utils
brew install git          # Fresh version of git
brew install coreutils    # GNU coreutils
brew install moreutils    # More utils
brew install telnet       # Telnet client

# Fancy things 
brew install jq
brew install lsd          # Like ls, but fancier
brew install exa          # Like ls, but fancier (includes l)
brew install curlie       # Like curl, but fancier
brew install cheat        # Cheat sheets for many commands
brew install htop
brew install bottom       # btm

# Something more complex
brew install neovim
brew install rclone       # CLI for cloud storages access
brew install gromgit/fuse/sshfs-mac
brew install pgcli    # Fancy postgres client
pipx install litecli  # Fancy sqlite client

# Docker tools
brew install dive        # Inspect Docker images
brew install lazydocker  # Docker UI

# Video and image editing
brew install ffmpeg
brew install imagemagick
```

On Ubuntu:

```shell
# Base utils
apt install git
apt install coreutils
apt install moreutils
apt install telnet

# Fancy things
apt install jq
apt install exa
apt install htop
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb

# Something more complex
apt install neovim
apt install rclone
apt install pgcli
pipx install litecli

# Docker tools
go install github.com/wagoodman/dive@latest
go install github.com/jesseduffield/lazydocker@latest

# Video and image editing
apt install ffmpeg
apt install imagemagick
```


## Go

On Mac (usually Homebrew has the latest version):

```shell
brew install go
go env | grep GOPATH  # should be ~/go
```

On Ubuntu:

```shell
cd ~
wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz

cd /opt
sudo tar xfa ~/go1.22.0.linux-amd64.tar.gz
sudo ln -s /opt/go/bin/* /usr/local/bin/

go env | grep GOPATH  # should be ~/go
```


## Python

On Mac:

```shell
brew install ipython      # ipython
brew install virtualenv   # virtualenv
brew install pyenv        # Python versions manager
brew install pipx         # install Python apps in isolated environments
```

On Ubuntu:

```shell
apt install python3.12
apt install python3.12-venv
apt install pipx
apt install python3-ipython
```

On both systems:

```shell
# `pipx` is a tool to install and run Python applications (such as Poetry or Invoke) in isolated environments.
# Install it from brew/apt, and then:
pipx ensurepath  # or add ~/.local/bin to $PATH manually wherever you set it

# Managing virtual environments
pipx install poetry

# Invoke runs commands from `tasks.py` in current working directory, just like `make`.
pipx install invoke
pipx inject invoke fabric
```


## Rust

I use `rustup` to make cross-compilation easier.

On Mac:

```shell
brew install rustup-init
rustup-init  # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustup target add x86_64-unknown-linux-gnu
rustc -V && cargo -V
```

On Ubuntu:
```shell
curl https://sh.rustup.rs -sSf | sh  # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustc -V && cargo -V
```


## GUI

```shell
brew install qbittorrent  # Torrent client
brew install alt-tab      # Better app switching UX
brew install imhex
```


## Quick look plugins

```shell
brew install qlcolorcode
brew install qlstephen
brew install qlmarkdown
brew install quicklook-json
brew install qlimagesize
brew install suspicious-package
brew install apparency
brew install quicklookase
brew install qlvideo
```
