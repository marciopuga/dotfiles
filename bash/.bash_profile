export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="$HOME/.npm-packages/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#shotcuts
alias cl='clear'
alias pg='cd ~/code/playground'
alias im='cd ~/code/bitbucket/immutable'
alias code='cd ~/code/'
alias dot='cd ~/dotfiles/'
alias temp='cd ~/code/temp'
alias d9='cd ~/code/bitbucket/district9'
alias deus='ssh deus'
alias lg='lazygit'
alias ovim='vim'
alias v='nvim'
alias vim='v'
alias k='kubectl'
alias serve='http-server'

alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'

# tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

function killport() {
  echo "Killing processes on port $1"
  lsof -i TCP:$1 | awk 'NR > 1 {print $2}'  | xargs kill -9
}

# COLOR MAN PAGES
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode
export VISUAL=nvim
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:50%' --previe 'bat --color=always --style=header,grid {}'"

# fkill - kill processes - list only the ones you can kill. Modified the earlier script.
fkill() {
    local pid
    if [ "$UID" != "0" ]; then
        pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
    else
        pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
    fi

    if [ "x$pid" != "x" ]
    then
        echo $pid | xargs kill -${1:-9}
    fi
}
