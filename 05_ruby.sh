alias irb='irb --readline -r irb/completion'

function druby() { 
  ruby -rubygems -I lib $@
}


# export GEM_HOME="$(brew --prefix)/Cellar/gems/1.9.1"
export GEM_HOME="/usr/local/Cellar/Gems"
export RUBYOPT=rubygems

if [[ -s /Users/nick/.rvm/scripts/rvm ]] ; then source /Users/nick/.rvm/scripts/rvm ; fi
