export PATH=$PATH:~/Dev/android/sdk/platform-tools/:~/Dev/android/sdk/tools/
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=${PATH}:$HOME/Dev/gsutil
export ANT_HOME=$HOME/Dev/apache-ant-1.9.4
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# mv, rm, cp
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'

#shotcuts
alias pg='cd ~/code/playground'
alias amex='cd ~/code/playground/amex'
alias swarm='export DOCKER_HOST=tcp://127.0.0.1:32768'
alias local='unset DOCKER_HOST'
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'

function swarm-logs() {
  echo "Getting swarm logs for $1"
  eval swarm
  docker logs $(docker ps --filter "name=$1" -q) --follow
  unset DOCKER_HOST
}


# added by Anaconda3 4.3.0 installer
export PATH="/Users/marciopuga/anaconda/bin:$PATH"
