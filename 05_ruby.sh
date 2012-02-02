alias irb='irb --readline -r irb/completion'

function druby() { 
  ruby -rubygems -I lib $@
}

alias bi='bundle install --path .bundle/gems'
alias be='bundle exec $*'

alias cap='bundle exec cap $*'
alias rake='bundle exec rake $*'
alias rails='bundle exec rails $*'
alias foreman='bundle exec foreman *$'


# export GEM_HOME="$(brew --prefix)/Cellar/gems/1.9.1"
export GEM_HOME="/usr/local/Cellar/Gems"
export RUBYOPT=rubygems

export RBXOPT=-Xrbc.db=/tmp/rbx

[[ -s "/Users/nick/Developer/.rvm/scripts/rvm" ]] && source "/Users/nick/Developer/.rvm/scripts/rvm"


function rvmall() {
  for i in system 1.8.7 1.9.2 rbx; do
    rvm use $i
    if [ -f Gemfile ]; then
      bundle exec $*
    else
      $*
    fi
  done
}

alias rvmbi='rvmall bundle install --path vendor/bundle'
