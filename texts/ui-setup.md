# Setting Up UI Apps

## CotEditor

Associate all text files

```shell
brew install yq
brew install duti

curl "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml" \
  | yq -r "to_entries | (map(.value.extensions) | flatten) - [null] | unique | .[]" \
  | xargs -L 1 -I "{}" duti -s com.coteditor.CotEditor {} all
```

Format JSON:

```shell
cp ~/.dotfiles/CotEditor/* "~/Library/Application Scripts/com.coteditor.CotEditor/"
```


## Karabiner Elements

* **caps_lock** -> **F16** (and System Settings -> Keyboard Shortcuts -> Input Methods -> F16 to change input method)
* **non_us_backslash** -> **grave_accent_and_tilde**`

```shell
cd ~/.config/karabiner/assets
rmdir complex_modifications
ln -s ~/.dotfiles/Karabiner/complex_modifications .
```

* add them in Karabiner Elements -> Complex Modifications -> Add predefined rule -> enable them


## BetterTouchTool

Import `BTT/exported_triggers.json`, it will set this up:

* Mic toggle
  * F5 -> Mic Toggle (Named Trigger)
  * Named Trigger -> Mic Toggle
  * Menu Bar Item -> MicToggleIcon
* F buttons
  * F6 (Key Up) -> Sleep Computer
  * Shift-F6 (Key Up) -> just press Shift-F6 without sleeping
  * F7/F8/F9 -> music control
* Grave accent in Birman English layout
  * F17 -> type text `` ` `` (it is triggered in Karabiner via `grave_accent_and_tilde` in Birman English layout)


## Fonts

- Download [MartianMono Nerd Font](https://www.nerdfonts.com/font-downloads) and add it to *Font Book*.

## JetBrains IDEs

To make p10k prompt look good in light color scheme, open Console Colors in Settings, and then make Blue background color darker, like foreground (e.g. #063FDB).

## Shortcuts

Open System Settings -> Keyboard -> Keyboard Shortcuts -> App Shortcuts:
- add Cmd-S for "Show Folders" and "Hide Folders" in Notes app

Open System Settings -> Keyboard -> Keyboard Shortcuts -> Services:
- set Cmd-F12 for "New iTerm2 Tab Here"


## Install

```shell
brew install qbittorrent  # Torrent client
brew install alt-tab      # Better app switching UX
brew install imhex
brew install --cask neovide
```


## Quick Look plugins

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

xattr -d -r com.apple.quarantine ~/Library/QuickLook
```
