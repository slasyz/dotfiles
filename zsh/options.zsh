HISTSIZE=10000
SAVEHIST=10000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
# Set history immediately, and load it before rendering the prompt (in other words, after Enter is pressed).
setopt share_history          # share command history data


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

# fn + left/right
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# opt + left-right
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
# Make it stop at symbols like /
autoload -U select-word-style
select-word-style bash
