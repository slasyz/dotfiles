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


### GnuPG

```
$ gpg --full-generate-key  # use rsa4096

$ gpg --list-secret-keys --keyid-format=long
/Users/slasyz/.gnupg/pubring.kbx
--------------------------------
sec   rsa4096/5356DFBD3A63CBEF 2022-08-07 [SC] [expires: 2027-08-06]
      0C32AA0720A4B388FCC93A185356DFBD3A63CBEF
uid                 [ultimate] Vyacheslav Syrovatsky <slasyz@gmail.com>
ssb   rsa4096/A89C990D8BB08F6D 2022-08-07 [E] [expires: 2027-08-06]

$ git config --global user.signingkey 5356DFBD3A63CBEF
$ git config --global commit.gpgsign true

$ gpg --armor --export 0C32AA0720A4B388FCC93A185356DFBD3A63CBEF  # add this to GitHub
```
