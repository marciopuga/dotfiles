export PATH=$PATH:~/Dev/android/sdk/platform-tools/:~/Dev/android/sdk/tools/
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=${PATH}:$HOME/Dev/gsutil
export ANT_HOME=$HOME/Dev/apache-ant-1.9.4
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

#shotcuts
alias pg='cd ~/code/playground'
alias amex='cd ~/code/playground/amex'
alias dklocal='unset DOCKER_HOST'
alias dkrmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

function swarm-logs() {
  echo "Getting swarm logs for $1"
  docker logs $(docker ps --filter "name=$1" -q) --follow
  unset DOCKER_HOST
}

function district9-swarm() {
  echo "Switching swarm to connect to district9"
  docker container stop $(docker ps --filter "name=client_proxy" -q)
  docker system prune
  docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST dockercloud/client marciopuga/district9
}

function carrots-swarm() {
  echo "Switching swarm to connect to carrots"
  docker container stop $(docker ps --filter "name=client_proxy" -q)
  docker system prune
  docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST dockercloud/client carrotsmoney/cloud
}
