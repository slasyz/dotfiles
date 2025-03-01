################################
# ohmyzsh-style history search #
################################

# Typing ls and hitting Up Arrow will scroll through commands that start with what you typed:
# matching `ls` and `ls -l` but not `echo ls`.

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
    autoload -U up-line-or-beginning-search
    zle -N up-line-or-beginning-search
    bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search  # TODO: why this doesn't always work?
fi
bindkey "^[[A" up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
    autoload -U down-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi
bindkey "^[[B" down-line-or-beginning-search


####################
# Arrow navigation #
####################

# fn + left/right: go to beginning/end of line
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
# cmd + left/right: go to beginning/end of line
bindkey "^[^[[D" beginning-of-line  # this is what JetBrains IDE terminal sends
bindkey "^[^[[C" end-of-line        # and this
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
# opt + left-right: go to previous/next word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[f" forward-word
bindkey "^[b" backward-word
# Make it stop at symbols like /
autoload -U select-word-style
select-word-style bash
# opt-delete to remove last word
bindkey '^[^?' backward-kill-word
bindkey "^[w" backward-delete-word
# Something sets this to vi-cmd-mode.  Remove it.
bindkey -r "^["


###############################
# Trim newlines after pasting #
###############################

function custom-bracketed-paste() {
  zle .bracketed-paste # Call the original bracketed-paste function
  local content=$LBUFFER # Get the content that was just pasted
  # Remove trailing newline if present
  if [[ ${content[-1]} == $'\n' ]]; then
    LBUFFER="${content[1,-2]}"
  fi
}
# Replace the default bracketed-paste with our custom version
zle -N bracketed-paste custom-bracketed-paste
