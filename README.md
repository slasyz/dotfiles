# dotfiles

This is a collection of my configs for various tools.

## Install

```shell
$ sudo scutil --set HostName mbp.local  # replace with proper value

$ git clone git@github.com:slasyz/dotfiles.git ~/.dotfiles

$ mv ~/.oh-my-zsh/custom{,.bak} || true
$ ln -s ~/.dotfiles/.oh-my-zsh/custom ~/.oh-my-zsh/custom
$ mv ~/.zshrc{,.bak} || true
$ ln -s ~/.dotfiles/.zshrc ~
$ mv ~/.p10k.zsh{,.bak} || true
$ ln -s ~/.dotfiles/.p10k.zsh ~

$ ~/.dotfiles/tools.sh
```

- open iTerm 2 -> General -> Preferences -> specify /home/username/.dotfiles/iTerm2 directory and saving changes automatically.
