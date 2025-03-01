# To enable arrows-driven completion suggestions
setopt MENU_COMPLETE
zstyle ':completion:*' menu select

# oh my zsh plugins dump completions files here
fpath=($ZSH_CACHE_DIR/completions $fpath)

# To enable colors in ls autocompletion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Case-insensitive autocompletion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle ':completion:*:*:make:*' tag-order 'targets'
