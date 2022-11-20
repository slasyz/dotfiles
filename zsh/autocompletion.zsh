autoload -U compinit promptinit bashcompinit url-quote-magic
compinit && promptinit && bashcompinit
zle -N self-insert url-quote-magic

# To enable arrows-driven completion suggestions
setopt MENU_COMPLETE
zstyle ':completion:*' menu select

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

# ohmyzsh-style history search:
# Typing ls and hitting Up Arrow will scroll through commands that start with what you typed: 
# matching `ls`` and `ls -l`` but not `echo ls`.
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search
