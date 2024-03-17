# Setting Up Console

## Download things

```shell
brew install homebrew/cask-fonts/font-hack-nerd-font
brew install zsh-syntax-highlighting  # zsh highlighting in shell

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```


## Set up zsh

```shell
sudo scutil --set HostName mbp.local  # replace with proper value

git clone git@github.com:slasyz/dotfiles.git ~/.dotfiles

mv ~/.zshrc{,.bak} || true
ln -s ~/.dotfiles/.zshrc ~
mv ~/.zimrc{,.bak} || true
ln -s ~/.dotfiles/.zimrc ~
mv ~/.p10k.zsh{,.bak} || true
ln -s ~/.dotfiles/.p10k.zsh ~
mv ~/.zshenv{,.bak} || true
ln -s ~/.dotfiles/.zshenv ~

~/.dotfiles/tools.sh
```

- open iTerm 2 -> General -> Preferences -> specify `/home/username/.dotfiles/iTerm2` directory and saving changes automatically.


## SSH, Git

```shell
ssh-keygen
ssh-add ~/.ssh/id_ed25519
git config --global user.signingkey "$(cat ~/.ssh/id_ed25519.pub)"
git config --global commit.gpgsign true
git config --global tag.gpgsign true

git config --global user.name "Vyacheslav Syrovatsky"
git config --global user.email "...@..."

git config --global push.autoSetupRemote true
```


## sshfs

Install [macFUSE](https://osxfuse.github.io/) and then:

```shell
brew install gromgit/fuse/sshfs-mac

sshfs sl@hetzner-1:/home/sl /Volumes/hetzner-1
ls ~/hetzner-1

umount /Volumes/hetzner-1
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


### Rust

I use `rustup` to make cross-compilation easier.

On Mac:

```shell
brew install rustup-init
rustup-init  # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustup target add x86_64-unknown-linux-gnu
rustc -V && cargo -V

# For gtk-rs
brew install gtk4 libadwaita pkg-config
```

On Ubuntu:

```shell
curl https://sh.rustup.rs -sSf | sh  # Use default parameters.  Check that .zshenv has single `. "$HOME/.cargo/env"` line.
rustc -V && cargo -V
```


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
brew install yq
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
