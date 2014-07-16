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
export PATH=/usr/local/share/python:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Projects
source /usr/local/bin/virtualenvwrapper.sh

# Enable brew bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Set the default ruby via chruby
chruby ruby-2.1.0

# Set colors 
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set Go variables
export GOROOT=/usr/local/Cellar/go/1.2/libexec
export GOPATH=~/Projects/gocode
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Sencha
export PATH=/Users/cedric/bin/Sencha/Cmd/5.0.0.160:$PATH
export SENCHA_CMD_3_0_0="/Users/cedric/bin/Sencha/Cmd/5.0.0.160"

# Set aliases
alias webfac="ssh shadowsun7@shadowsun7.webfactional.com"
alias fcs="ssh developer@wtheo.com"
alias tembu="ssh a0052147@tembusu.nus.edu.sg"
alias test_fcs="ssh cedric@106.186.24.119 -p 1010" 

alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

alias dnsclear="sudo killall -HUP mDNSResponder"
