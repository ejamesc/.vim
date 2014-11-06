# In case you keep forgetting: the bash_profile is
# triggered when bash is an interactive login shell
# See ~/.bashrc for specific environment shit
# Stuff here gets inherited in subsequent subshells, 
# which makes it possible to have things in vim !commands

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Ensure Python shit is usable
# export PATH=/usr/local/share/python:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Load in the git branch prompt script
source ~/.vim/.git-prompt.sh
# Set git branch display
export PS1="\h: \[\033[34;1m\]\W\[\033[m\]\[\e[32;1m\]|\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\e[0m\]\$ "

# Virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# Enable brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Set the default ruby via chruby
chruby ruby-2.1.2

# Set colors 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set Go variables
export GOPATH=~/Projects/gocode
export PATH=$PATH:$GOPATH/bin:/usr/local/opt/go/libexec/bin

# Sencha
export PATH=$PATH:/Users/cedric/bin/Sencha/Cmd/5.0.0.160
export SENCHA_CMD_3_0_0="/Users/cedric/bin/Sencha/Cmd/5.0.0.160"

# Set aliases
alias webfac="ssh webfac"
alias fcs="ssh fcs"

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias dnsclear="sudo killall -HUP mDNSResponder"
alias rds="redis-server /usr/local/etc/redis.conf"
alias rethinkdb.start='launchctl load /usr/local/opt/rethinkdb/homebrew.mxcl.rethinkdb.plist'
alias rethinkdb.stop='launchctl unload /usr/local/opt/rethinkdb/homebrew.mxcl.rethinkdb.plist'
