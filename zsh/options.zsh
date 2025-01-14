HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt hist_reduce_blanks
# Set history immediately, and load it before rendering the prompt (in other words, after Enter is pressed).
setopt share_history          # share command history data
