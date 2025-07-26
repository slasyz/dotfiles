# Setting Up Console

## Download things

```shell
brew install homebrew/cask-fonts/font-hack-nerd-font
brew install --cask font-martian-mono

# Also periodically run this: "zimfw upgrade" to upgrade zimfw, and "zimfw update" to update modules.
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```


## Set up shell

```shell
sudo scutil --set HostName mbp.local  # replace with proper value
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

git clone git@github.com:slasyz/dotfiles.git ~/.dotfiles

ln -s ~/.dotfiles/.zshrc ~
ln -s ~/.dotfiles/.zimrc ~
ln -s ~/.dotfiles/.p10k.zsh ~
ln -s ~/.dotfiles/.zshenv ~
ln -s ~/.dotfiles/.zprofile ~
ln -s ~/.dotfiles/ssh/config/ ~/.ssh/config
ln -s ~/.gitconfig ~/.gitconfig

ln -s ~/.dotfiles/.finicky.js ~
ln -s ~/.dotfiles/ghostty ~/.config/ghostty
ln -s ~/.dotfiles/zed/* ~/.config/zed
ln -s ~/.dotfiles/VSCode/{keybindings.json,settings.json} ~/Library/Application\ Support/Code/User/
ln -s ~/.dotfiles/Cursor/{keybindings.json,settings.json} ~/Library/Application\ Support/Cursor/User/

mv ~/Library/Application\ Support/Sublime\ Text/Packages/User{,.bak} || true
mv ~/Library/Application\ Support/Sublime\ Text/Packages/LSP{,.bak} || true
ln -s ~/.dotfiles/SublimeText/* ~/Library/Application\ Support/Sublime\ Text/Packages/
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/.local/bin/subl

ln -s /Applications/CotEditor.app/Contents/SharedSupport/bin/cot ~/.local/bin/cot

# Enable Touch ID for sudo
echo "auth       sufficient     pam_tid.so" > /etc/pam.d/sudo_local
```

Set up backing up ZSH history in cron (https://unix.stackexchange.com/questions/568907/why-do-i-lose-my-zsh-history):
```
30 14 * * * cp ~/.zsh_history ~/.zsh_history.bak$(date +\%Y_\%m_\%d)
```


## SSH, Git, etc

```shell
ssh-keygen
ssh-add --apple-use-keychain --apple-load-keychain ~/.ssh/id_ed25519
git config --global user.signingkey "$(cat ~/.ssh/id_ed25519.pub)"
```

## sshfs

Install [macFUSE](https://osxfuse.github.io/) and then:

```shell
brew install gromgit/fuse/sshfs-mac

sshfs sl@hetzner-1:/home/sl /Volumes/hetzner-1
ls /Volumes/hetzner-1

umount /Volumes/hetzner-1
```

## NTFS

```shell
brew install gromgit/fuse/ntfs-3g-mac
sudo ntfs-3g /dev/diskXXX /Volumes/YYY
```


## Languages

### Go

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


### Python

On Mac:

```shell
brew install ipython      # ipython
brew install virtualenv   # virtualenv
brew install uv           # (1) virtual env manager (poetry replacement)
                          # (2) Python versions manager (pyenv replacement)
                          # (3) Python tools manager (pipx replacement)
```

On Ubuntu:

```shell
apt install python3.12
apt install python3.12-venv
apt install python3-ipython
curl -LsSf https://astral.sh/uv/install.sh | sh
```

On both systems:

```shell
uv tool update-shell  # or add ~/.local/bin to $PATH manually wherever you set it

# Install Poetry for managing virtual environments (for old projects; I use uv for new projects)
uv tool install poetry

# Install Invoke to run commands from `tasks.py` in current working directory, just like `make`.
# And add fabric as its dependency so you can use SSH in tasks.py.
uv tool install invoke --with fabric

uv tool install litecli   # Fancy sqlite client
uv tool install aider     # AI-powered agentic code assistant
```


### Rust

I use `rustup` to make cross-compilation easier.

On Mac:

```shell
brew install rustup
rustup toolchain # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustup target add x86_64-unknown-linux-gnu
rustc -V && cargo -V

cargo install tauri-cli
brew install cargo-nextest

# For gtk-rs
brew install gtk4 libadwaita pkg-config

# To update cargo
rustup toolchain install stable-aarch64-apple-darwin
```

On Ubuntu:

```shell
curl https://sh.rustup.rs -sSf | sh  # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustc -V && cargo -V
```


## Docker

On Mac, I just install OrbStack. But in order to install and set up colima, do this:

```shell
brew install colima
brew install qemu

brew install docker-buildx
mkdir -p ~/.docker/cli-plugins
ln -sfn $HOMEBREW_PREFIX/opt/docker-buildx/bin/docker-buildx ~/.docker/cli-plugins/docker-buildx

colima start
```


## Tools

On Mac:

```shell
# Base utils
brew install git          # Fresh version of git
brew install coreutils    # GNU coreutils
brew install moreutils    # More utils
brew install telnet       # Telnet client

# Fancy things
brew install jq
brew install yq
brew install lsd          # Like ls, but fancier
brew install eza          # Like ls, but fancier (includes l)
brew install curlie       # Like curl, but fancier
brew install bat          # Like cat, but fancier
brew install cheat        # Cheat sheets for many commands
brew install htop
brew install bottom       # btm
brew install ripgrep

# Something more complex
brew install neovim
brew install rclone       # CLI for cloud storages access
brew install gromgit/fuse/sshfs-mac
brew install pgcli        # Fancy postgres client

# AI
brew install codex
brew install repomix

# Docker tools
brew install dive        # Inspect Docker images
brew install lazydocker  # Docker UI

# Video and image editing
brew install ffmpeg
brew install imagemagick
brew install graphviz  # e.g. dot tool

# Etc
brew install postgres
brew install pgvector
# And also run "CREATE EXTENSION IF NOT EXISTS pg_vector;" for every database

brew install --cask finicky
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
apt install htop
curl -LO https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb
sudo dpkg -i bottom_0.9.6_amd64.deb

sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Something more complex
apt install neovim
apt install rclone
apt install pgcli

# Docker tools
go install github.com/wagoodman/dive@latest
go install github.com/jesseduffield/lazydocker@latest

# Video and image editing
apt install ffmpeg
apt install imagemagick
```
