# In case you keep forgetting: the bash_profile is
# triggered when bash is an interactive login shell
# See ~/.bashrc for specific environment shit
# Stuff here gets inherited in subsequent subshells, 
# which makes it possible to have things in vim !commands

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/sbin:$PATH"
# Ensure Python shit is usable
#export PATH=/usr/local/lib/python2.7/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# temporarily add arcanist shit
export PATH="$PATH:/opt/phab/arcanist/bin"
# add flutter to the the path
export PATH="$PATH:/Users/cedric/Projects/flutter/bin"

# Load in the git branch prompt script
source ~/.vim/.git-prompt.sh
# Load in kubectl prompt
source ~/.vim/.kube-ps1.sh
export KUBE_PS1_SEPARATOR=''
export KUBE_PS1_PREFIX='|'
export KUBE_PS1_SUFFIX=''
export PS1="\h: \[\033[34;1m\]\W\[\033[m\]\[\e[32;1m\]|\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$(kube_ps1)\[\e[0m\]\$ "

# Enable kubectl prompt
NORMAL="\[\033[00m\]"
BLUE="\[\033[01;34m\]"
GREEN="\[\e[1;32m\]"
# export PS1="${BLUE}\W ${GREEN}\u${YELLOW}\$(__kube_ps1)${NORMAL} \$ "

# Virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

# Enable bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Enable brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Enable git bash completion
if [ -f ~/.git-completion.bash  ]; then
    . ~/.git-completion.bash
fi

# Set the default ruby via chruby
chruby ruby-2.1.2

# Set colors 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set Go variables
export GOPATH=~/Projects/gocode
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

# Set locales, needed for some OSS projects
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set aliases
alias webfac="ssh webfac"
alias cmg="cd $GOPATH/src/gitlab.com/ejames/commoncog/"
alias mig="migrate -url postgres://metacogdev:metacogdev@localhost/metacogdev\?sslmode=disable -path $GOPATH/src/bitbucket.org/ejames/metacog/migrations"
alias wip="git commit -a -m WIP"
alias squish="git status && git commit -a --amend -C HEAD"
alias arclandish="arc patch --nobranch"
function migcreate {  touch "$(date +%s)_$1."{up,down}".sql";  }

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias gtest="go test \$(go list ./... | grep -v /vendor/)"

alias dnsclear="sudo killall -HUP mDNSResponder"
alias rds="redis-server /usr/local/etc/redis.conf"
alias ns='nosetests -sd'
alias rabbitmq-server='/usr/local/sbin/rabbitmq-server'
alias rabbitmqctl='/usr/local/sbin/rabbitmqctl'
alias pgstart='launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'
alias pgstop='launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist'

# alias rethinkdb.start='launchctl load /usr/local/opt/rethinkdb/homebrew.mxcl.rethinkdb.plist'
# alias rethinkdb.stop='launchctl unload /usr/local/opt/rethinkdb/homebrew.mxcl.rethinkdb.plist'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/cedric/Projects/google-cloud-sdk/path.bash.inc' ]; then source '/Users/cedric/Projects/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/cedric/Projects/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/cedric/Projects/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/node@8/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/cedric/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/cedric/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/cedric/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/cedric/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

