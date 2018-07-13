export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH="/usr/local/heroku/bin:/Users/marciopuga/google-cloud-sdk/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/marciopuga/Dev/android/sdk/platform-tools/:/Users/marciopuga/Dev/android/sdk/tools/:/Users/marciopuga/Dev/gsutil"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#shotcuts
alias pg='cd ~/Code/playground'
alias tac='cd ~/Code/github/grumpysailor/tac'
alias deus='ssh deus'
alias tmuxa='tmux a -t'

alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim

function swarm-logs() {
  echo "Getting swarm logs for $1"
  docker logs $(docker ps --filter "name=$1" -q) --follow
  unset DOCKER_HOST
}

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
