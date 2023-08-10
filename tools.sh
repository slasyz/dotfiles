# ZSH stuff

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# GUI

brew install keepassxc    # Password manager
brew install qbittorrent  # Torrent client
brew install alt-tab      # Better app switching UX

# Shell utils

brew install git          # Fresh version of git
brew install coreutils    # GNU coreutils
brew install moreutils    # More utils
brew install telnet       # Telnet client

brew install jq
brew install lsd          # Like ls, but fancier
brew install exa          # Like ls, but fancier
brew install curlie       # Like curl, but fancier
brew install cheat        # Cheat sheets for many commands
brew install htop

brew install neovim
brew install rclone       # CLI for cloud storages access

brew install gpg
brew install gpg-suite

brew install homebrew/cask-fonts/font-hack-nerd-font
brew install zsh-syntax-highlighting  # zsh highlighting in shell

# Coding

brew install ipython      # ipython
brew install virtualenv   # virtualenv
brew install pyenv        # Python versions manager

brew install ansible
brew install ansible-lint  # For VS Code linter

brew install go           # Go
brew install rustup       # Rust

brew install pgcli        # Fancy postgres client

# Quick look plugins

brew install qlcolorcode
brew install qlstephen
brew install qlmarkdown
brew install quicklook-json
brew install qlimagesize
brew install suspicious-package
brew install apparency
brew install quicklookase
brew install qlvideo

# Other stuff

brew install ffmpeg
brew install imagemagick
