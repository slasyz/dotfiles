# shell

## Download things

```shell
brew install homebrew/cask-fonts/font-hack-nerd-font

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/lukechilds/zsh-nvm "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-nvm"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```


## Set up zsh

```shell
$ sudo scutil --set HostName mbp.local  # replace with proper value

$ git clone git@github.com:slasyz/dotfiles.git ~/.dotfiles

$ mv ~/.zshrc{,.bak} || true
$ ln -s ~/.dotfiles/.zshrc ~
$ mv ~/.zimrc{,.bak} || true
$ ln -s ~/.dotfiles/.zimrc ~
$ mv ~/.p10k.zsh{,.bak} || true
$ ln -s ~/.dotfiles/.p10k.zsh ~
$ mv ~/.zshenv{,.bak} || true
$ ln -s ~/.dotfiles/.zshenv ~

$ ~/.dotfiles/tools.sh
```

- open iTerm 2 -> General -> Preferences -> specify `/home/username/.dotfiles/iTerm2` directory and saving changes automatically.


## SSH, Git

```
$ ssh-keygen
$ ssh-add ~/.ssh/id_ed25519
$ git config --global user.signingkey "$(cat ~/.ssh/id_ed25519.pub)"
$ git config --global commit.gpgsign true
$ git config --global tag.gpgsign true

$ git config --global user.name "Vyacheslav Syrovatsky"
$ git config --global user.email "...@..."

$ git config --global push.autoSetupRemote true
```
