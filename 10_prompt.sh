set -x

setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"
PS_ROOT_HASH="%{[0m%}%(#:%{[0;31m%}#%{[0m%}:)"

prompt_dir () {
   print -nP "%~" | sed -Ef ~/.zshkit/prompt_dir.sed
}

PROMPT='\
%{$reset_color%}\
$PS_ERROR\
$PS_USER\
$PS_HOST\
:%{$fg[cyan]%}$(prompt_dir)%{$reset_color%}\
$(git-prompt)\
$PS_ROOT_HASH\
 '

set +x