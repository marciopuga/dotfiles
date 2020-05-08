export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=/usr/local/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH="$HOME/.npm-packages/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#shotcuts
alias cl='clear'
alias pg='cd ~/code/playground'
alias code='cd ~/code/'
alias dot='cd ~/dotfiles/'
alias temp='cd ~/code/temp'
alias d9='cd ~/code/bitbucket/district9'
alias deus='ssh deus'
alias tmuxa='tmux a -t'
alias lg='lazygit'
alias v='nvim'
alias k='kubectl'
alias serve='http-server'

alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'

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
export VISUAL=vim
export EDITOR=vim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
