# UI setup

## CotEditor

Associate all text files

```shell
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
* **non_us_backslash** -> **grave_accent_and_tilde**
* **grave_accent_and_tilde** -> **F17**

## BetterTouchTool

* import `BTT/exported_triggers.json`
* Keep iTerm 2 on top.
  Triggers: open iTerm 2 and double-click on menubar
  Action: Pin/Unpin Focused Window To Float On Top
