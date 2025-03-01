###########
# General #
###########

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

# cd without cd
setopt autocd


##################
# Autocompletion #
##################

# To enable arrows-driven completion suggestions
setopt MENU_COMPLETE
zstyle ':completion:*' menu select
# oh my zsh plugins dump completions files here
fpath=($ZSH_CACHE_DIR/completions $fpath)
# To enable colors in ls autocompletion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# Case-insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# In "make" autocompletion show targets first
zstyle ':completion:*:*:make:*' tag-order 'targets'
