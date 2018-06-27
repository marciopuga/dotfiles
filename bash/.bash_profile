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
