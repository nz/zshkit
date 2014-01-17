alias irb='irb --readline -r irb/completion'

function druby() { 
  ruby -rubygems -I lib $@
}

alias bi='bundle install --path .bundle/gems'
alias be='bundle exec $*'

# export GEM_HOME="$(brew --prefix)/Cellar/gems/1.9.1"
# export GEM_HOME="/usr/local/Cellar/Gems"
export RUBYOPT=rubygems

export RBXOPT=-Xrbc.db=/tmp/rbx
