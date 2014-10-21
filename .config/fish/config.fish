. /opt/boxen/env.fish

set --erase fish_greeting
set -g -x EDITOR /usr/bin/vim
set -g -x CDPATH . ~

# add a "tree" command like the one included in Ubuntu
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
