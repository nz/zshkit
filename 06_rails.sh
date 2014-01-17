alias sc='./script/console'

function cap() {
  if [ -f Gemfile ]; then
    bundle exec cap $*
  else
    cap $*
  fi
}

function rake() {
  if [ -f Gemfile ]; then
    bundle exec rake $*
  else
    rake $*
  fi
}

function rails() {
  if [ -f Gemfile ]; then
    bundle exec rails $*
  else
    rails $*
  fi
}

function r() {
  if [ -f Gemfile ]; then
    bundle exec rails $*
  else
    rails $*
  fi
}

function foreman() {
  if [ -f Gemfile ]; then
    bundle exec foreman $*
  else
    foreman $*
  fi
}

function guard() {
  if [ -f Gemfile ]; then
    bundle exec guard $*
  else
    guard $*
  fi
}


