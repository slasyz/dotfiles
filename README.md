# dotfiles

This is a collection of my configs for various tools and some notes about them.

## Install

```shell
$ sudo scutil --set HostName mbp.local  # replace with proper value

$ git clone git@github.com:slasyz/dotfiles.git ~/.dotfiles

$ mv ~/.zshrc{,.bak} || true
$ ln -s ~/.dotfiles/.zshrc ~
$ mv ~/.zimrc{,.bak} || true
$ ln -s ~/.dotfiles/.zimrc ~
$ mv ~/.p10k.zsh{,.bak} || true
$ ln -s ~/.dotfiles/.p10k.zsh ~

$ ~/.dotfiles/tools.sh
```

- open iTerm 2 -> General -> Preferences -> specify /home/username/.dotfiles/iTerm2 directory and saving changes automatically.


### SSH, Git

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


### Hacks

Associate all text files with CotEditor:

```
curl "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml" \
  | yq -r "to_entries | (map(.value.extensions) | flatten) - [null] | unique | .[]" \
  | xargs -L 1 -I "{}" duti -s com.coteditor.CotEditor {} all
```

Karabiner Elements:
* **caps_lock** -> **F16** (and System Settings -> Keyboard Shortcuts -> Input Methods -> F16 to change input method)
* **non_us_backslash** -> **grave_accent_and_tilde**
* **grave_accent_and_tilde** -> **F17**

BetterTouchTool:
* Keep iTerm 2 on top.
  Triggers: open iTerm 2 and double-click on menubar
  Action: Pin/Unpin Focused Window To Float On Top

Format JSON in CotEditor:
```
cp ~/.dotfiles/CotEditor/* "~/Library/Application Scripts/com.coteditor.CotEditor/"
```



### Usable GUI apps

* **Airflow** — stream video via Airplay
* **AltTab** — better apps switching tool
* **Amphetamine** — prevent Mac from sleep
* **Arc** — fancy browser
* **CapCut** — video editor (also DaVinci Resolve)
* **CotEditor** — the simplest text editor
* **DiffusionBee** — StableDiffusion GUI
* **HandBrake** — ffmpeg GUI
* **IINA** — nice looking video player
* **iTerm** — terminal
* **NepTunes** — show currently playing song in menu bar
* **Pixelmator Pro** — image editor
* **Raycast** — swiss knife
* **Rectangle** — window management
* **Skim** — PDF viewer
* **Splashtop** — remote access
* **Strongbox** — password manager
* **Sublime Merge** — Git GUI
* **Sublime Text** — yet another text editor
* **Todoist** — TODO list
* **Unarchiver** — unarchiver
* **UTM** — open source QEMU GUI
* **Visual Studio Code** — editor/IDE
* **Warp** — fancy new terminal

* **Setapp** — collection of apps
  * **Archiver** — archiver/unarchiver
  * **Bartender** — hide icons in menu bar
  * **BetterTouchTool** — automatizations (like keeping some apps on top)
  * **BusyCal** — powerful calendar client
  * **CleanMyMac X** — cleaning stuff
  * **CleanShot X** — powerful screenshot tool
  * **Coherence X** — create Chromium-based apps for webpages (like ChatGPT)
  * **Dash** — offline docs
  * **DevUtils** — handy shortcuts for JSON formatting, timestamps converting and many more
  * **Gemini** — delete duplicated photos
  * **Jump Desktop** — RDP client
  * **KeySmith** — runs macro on shortcut
  * **Nitro PDF Pro** — PDF editor
  * **Presentify** — leave marks on screen
  * **RapidAPI** — like Postman, but better (ex-Paw)
