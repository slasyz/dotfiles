autoload -U compinit promptinit bashcompinit url-quote-magic && compinit && promptinit && bashcompinit
zle -N self-insert url-quote-magic

# To enable arrows-driven completion suggestions
setopt MENU_COMPLETE
zstyle ':completion:*' menu select

# zstyle ':completion:*::::' completer _expand _complete _ignored _approximate
# zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'
# zstyle ':completion:*:expand:*' tag-order all-expansions
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~''*?.old' '*?.pro'
# zstyle ':completion:*:functions' ignored-patterns '_*'
# zstyle ':completion:*' menu yes select

# To enable colors in ls autocompletion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*:*:make:*' tag-order 'targets'
