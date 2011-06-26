setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"
PS_ROOT_HASH="%{[0m%}%(#:%{[0;31m%}#%{[0m%}:)"

prompt_dir () {
   print -nP "%~" | sed -Ef ~/.zshkit/prompt_dir.sed
}

PROMPT_DIR=":%{$fg[cyan]%}$(prompt_dir)%{$reset_color%}"

# :%{$fg[cyan]%}$(print -nP %~)%{$reset_color%}\

PROMPT='\
%{$reset_color%}\
$PS_ERROR\
$PS_USER\
$PS_HOST\
$PROMPT_DIR\
$(git-prompt)\
$PS_ROOT_HASH\
 '
