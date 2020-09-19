# bashrc is loaded every time you start an interactive shell
# that is not a login shell.

# Configure chruby
source /usr/local/share/chruby/chruby.sh
# Enable chruby auto-switching based on .ruby-version in folder
source /usr/local/share/chruby/auto.sh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash ] && . /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/sls.bash ] && . /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/slss.bash ] && . /Users/cedric/.config/yarn/global/node_modules/tabtab/.completions/slss.bash
