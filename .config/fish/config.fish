set -g -x PATH /usr/local/bin $PATH
set -g -x fish_greeting ''
set -g -x EDITOR /usr/bin/vim

# rbenv setup
set -g -x PATH $HOME/.rbenv/bin $PATH
. (rbenv init -|psub)

# put ./bin in the path for use with bundler's binstubs ("bundle install --binstubs")
set -g -x PATH ./bin $PATH

# add a "tree" command like the one included in Ubuntu
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
