export PATH=$HOME/.bin:$PATH:$HOME/go/bin
export EDITOR='nvim'
export GOPATH=$HOME/go
export GPG_TTY=$TTY
export LSCOLORS=Gxfxcxdxbxegedabagacad

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

export HISTFILE=$HOME/.zsh_history

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

if [[ "$(hostname)" == "hetzner-1" ]]; then
  export DOCKER_HOST="/run/user/1000/podman/podman.sock";
fi