export PATH=$HOME/.bin:$PATH:$HOME/go/bin:$HOME/.local/bin:$HOME/Documents/Qt/6.6.2/macos/bin
export EDITOR='nvim'
export GOPATH=$HOME/go
export GPG_TTY=$TTY

export LESS_TERMCAP_mb=$'\e[1;31m'     # mb: begin blinking as bold red
export LESS_TERMCAP_md=$'\e[1;33m'     # md: begin blink (often represents bold, but code might be terminal-specific)
export LESS_TERMCAP_so=$'\e[01;44;37m' # so: begin reverse video with blue background and white text
export LESS_TERMCAP_us=$'\e[01;94m'    # us: begin underline in light blue
export LESS_TERMCAP_me=$'\e[0m'        # me: reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'        # se: reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'        # ue: reset underline

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

export HISTFILE=$HOME/.zsh_history
export ZSH_CACHE_DIR="$HOME/.cache/zsh"

#[[ -f '/Applications/Tailscale.app/Contents/MacOS/Tailscale' ]] && alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
#export TAILSCALE_IP=$(tailscale ip -4)

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

. "$HOME/.cargo/env"
