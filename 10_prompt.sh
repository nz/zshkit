setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"

function prompt_dir () {
  echo -n ":%{$fg[cyan]"
  print -nP "%~" | ruby -p -e 'n = 3; l = 3; a = $_.split(/\//); $_ = (a[0..(-n - 1)].map{|s|s.length > l ? "#{s[0,l]}…" : s} + a[(-n)..-1]).join("'$fg[blue]'/'$fg[cyan]'") if a.length > n'
  echo -n "%{$reset_color"
}

PS_ROOT_HASH="%{[0m%}%(#:%{[0;31m%}#%{[0m%}:)"

PROMPT='\
%{$reset_color%}\
$PS_ERROR\
$PS_USER\
$PS_HOST\
$(prompt_dir)\
$(git-prompt)\
$PS_ROOT_HASH\
 '
