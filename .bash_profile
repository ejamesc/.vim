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
# export PATH=/usr/local/share/python:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# temporarily add arcanist shit
export PATH="$PATH:/opt/phab/arcanist/bin"

# Load in the git branch prompt script
source ~/.vim/.git-prompt.sh
# Set git branch display
export PS1="\h: \[\033[34;1m\]\W\[\033[m\]\[\e[32;1m\]|\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\[\e[0m\]\$ "
#export PROMPT_COMMAND='__git_ps1 "\u@\h:\w" "\\\$ "'

# Virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

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

# Sencha
export PATH=$PATH:/Users/cedric/bin/Sencha/Cmd/5.0.0.160
export SENCHA_CMD_3_0_0="/Users/cedric/bin/Sencha/Cmd/5.0.0.160"

# Set locales, needed for some OSS projects
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set aliases
alias webfac="ssh webfac"
alias fcs="ssh fcs"
alias mig="migrate -url postgres://metacogdev:metacogdev@localhost/metacogdev\?sslmode=disable -path $GOPATH/src/bitbucket.org/ejames/metacog/migrations"
alias wip="git commit -a -m WIP"
alias squish="git status && git commit -a --amend -C HEAD"

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias dnsclear="sudo killall -HUP mDNSResponder"
alias rds="redis-server /usr/local/etc/redis.conf"
alias ns='nosetests -sd'
