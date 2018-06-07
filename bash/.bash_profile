export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/usr/lib/google-cloud-sdk/bin:$PATH"
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=${PATH}:$HOME/Dev/gsutil
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/usr/local/go/bin

#shotcuts
alias pg='cd ~/Code/playground'
alias tac='cd ~/Code/github/grumpysailor/tac'
alias deus='ssh deus'
alias dkrmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias tmuxa='tmux a -t'

alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'

function swarm-logs() {
  echo "Getting swarm logs for $1"
  docker logs $(docker ps --filter "name=$1" -q) --follow
  unset DOCKER_HOST
}
