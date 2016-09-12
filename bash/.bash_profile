export PATH=$PATH:~/Dev/android/sdk/platform-tools/:~/Dev/android/sdk/tools/
export PATH=/usr/local/share/npm/bin:$PATH
export PATH=$HOME/Library/Python/2.7/bin:$PATH
export PATH=${PATH}:$HOME/Dev/gsutil
export ANT_HOME=$HOME/Dev/apache-ant-1.9.4
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'

# Set CLICOLOR if you want Ansi Colors in iTerm2
export CLICOLOR=1
# export TERM=xterm-256color

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

function lazygit() {
    git commit -a -m "$*"
    git push
}

