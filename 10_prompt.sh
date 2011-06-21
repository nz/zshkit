setopt prompt_subst

PS_ERROR="%(?::%{$fg_bold[white]$bg[red]%}[%?]%{$reset_color%} )"
PS_USER="%(#:%{$fg[red]%}:%{$fg[cyan]%})%n%{$reset_color%}"
PS_HOST="@%{$fg[cyan]%}%m%{$reset_color%}"


export prompt_path_max=20
export prompt_path_segment=3

prompt_dir () {
    print -nP ":%~" | sed '
        :loop
        /.\{'$prompt_path_max'\}/{
            s@\(/[^/]\{'$prompt_path_segment'\}\)[^/]\{1,\}[^\\]/@\1\\/@
            tloop
            s@\(^[^/]\{'$prompt_path_segment'\}\)[^/]\{1,\}[^\\]/@\1\\/@
        }
        s@\\/@…/@g
        s@\([~/]\{1,\}\)@'"$fg[blue]\1$fg[cyan]"'@g
    '
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
