# I want a custom ~/.bin and also local rubygems
path=(./bin $HOME/.bin /usr/local/bin $path)

# The basic manpath
manpath=(/sw/share/man /usr/man /usr/X11R6/man /usr/local/man:/usr/share/man /usr/lib/perl5/man)

# Allow MacPorts man pages
manpath=($manpath /opt/local/man)
