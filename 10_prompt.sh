setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"
PS_ROOT_HASH="%{[0m%}%(#:%{[0;31m%}#%{[0m%}:)"

export prompt_path_max=20
export prompt_path_segment=3
export prompt_path_keep=1

prompt_dir () {
   local max=$prompt_path_max
   local segment=$[ prompt_path_segment - 1 ]
   local keep=$prompt_path_keep
   print -nP ':%~' | sed '
       :while
       /^.\{'$max'\}/{
           s@\(/[^/]\{'$segment'\}\)[^/][^/]*[^\\]\(\(/.*\)\{'$keep',\}\)$@\1\\○\2@
           twhile
           s@\(^[^/]\{'$segment'\}\)[^/][^/]*[^\\]\(\(/.*\)\{'$keep',\}\)$@\1\\○\2@
       }
       s@\\/@…/@g
       s@\\$@…@
       s@/@'"%{$fg[blue]%}/%{$fg[cyan]%}"'@g
       s@^:\([~/]*\)@:'"%{$fg[blue]%}\1%{$fg[cyan]%}"'@
   '
}

# :%{$fg[cyan]%}$(print -nP %~)%{$reset_color%}\

PROMPT='\
%{$reset_color%}\
$PS_ERROR\
$PS_USER\
$PS_HOST\
$(prompt_dir)\
$(git-prompt)\
$PS_ROOT_HASH\
 '
