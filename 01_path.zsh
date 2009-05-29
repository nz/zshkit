# I want /opt/local/bin to take precedence
path=($HOME/.bin /opt/local/bin /opt/local/libexec/git-core $path)

# Allow MacPorts man pages
manpath=($manpath /opt/local/man)
