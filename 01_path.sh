# I want a custom ~/.bin and also local rubygems
path=(./bin ./node_modules/.bin $HOME/.bin /usr/local/bin $path)

# The basic manpath
manpath=(/sw/share/man /usr/man /usr/X11R6/man /usr/local/man:/usr/share/man /usr/lib/perl5/man)

# Allow MacPorts man pages
manpath=($manpath /opt/local/man)

# homebrew - recommended by brew doctor
export PATH="/usr/local/bin:$PATH"

# homebrew global node modules
export PATH="$PATH:/usr/local/lib/node_modules"

# nvm through homebrew
if [ -x brew ]; then
  nvmsh=$(brew --prefix nvm)/nvm.sh
  if [ -f $nvmsh ]; then
    source $nvmsh
  fi
fi

# rbenv
if [ -x rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh --no-rehash)"
fi
