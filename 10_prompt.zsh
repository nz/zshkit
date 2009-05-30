setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"
PS_DIR=":%{$fg[cyan]%}%~%{$reset_color%}"
PS_ROOT_HASH="%{[0m%}%(#:%{[0;31m%}#%{[0m%}:)"

PROMPT='\
%{$reset_color%}\
$PS_ERROR\
$PS_USER\
$PS_HOST\
$PS_DIR\
$PS_GIT\
$(git-prompt)\
$PS_ROOT_HASH\
 '
