# ohmyzsh-style history search:
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


# cd without cd
setopt autocd


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

# Something sets this to vi-cmd-mode.  Remove it.
bindkey -r "^["

bindkey "^[w" backward-delete-word
