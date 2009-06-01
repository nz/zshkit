if [[ -x `which git` ]]; then

	alias g=git
	alias gd='git diff'
	alias gs='git status'

	function git-branch-name () {
		git branch 2> /dev/null | grep '^\*' | sed 's/^\*\ //'
	}
	function git-dirty () {
		git status 2> /dev/null | grep "nothing to commit (working directory clean)"
		echo $?
	}
	function gsrb () {
		branch=$(git-branch-name) 
		git checkout master
		git svn rebase
		git checkout "${branch}"
		git rebase master
	}
	function git-prompt() {
		gstatus=$(git status 2> /dev/null)
		branch=$(echo $gstatus | head -1 | sed 's/^# On branch //')
		dirty=$(echo $gstatus | sed 's/^#.*$//' | tail -2 | grep 'nothing to commit (working directory clean)'; echo $?)
		ahead=$(echo $gstatus | head -2 | grep -c 'ahead')
		behind=$(echo $gstatus | head -2 | grep -c 'behind')
		diverged=$(echo $gstatus | head -2 | grep -c 'diverged')
		if [[ x$branch != x ]]; then
			indicator=""
			dirty_color=$fg[green]
			if [[ $dirty		= 1 ]] { dirty_color=$fg[magenta] }
			if [[ $ahead		= 1 ]] { indicator="↑" }
			if [[ $behind		= 1 ]] { indicator="↓" }
			if [[ $diverged = 1 ]] { indicator="↕" }
			[ x$branch != x ] && echo " %{$dirty_color%}$branch%{$reset_color%}$indicator"
		fi
	}
	# similar to the above, but without checking to see if the branch is dirty
	function git-prompt-lite() {
		ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
		echo " %{$fg[cyan]%}${ref#refs/heads/}%{$reset_color%}"
	}
	
	function git-scoreboard () {
		git log | grep Author | sort | uniq -ci | sort -r
	}
	function git-track () {
		branch=$(git-branch-name)
		git config branch.$branch.remote origin
		git config branch.$branch.merge refs/heads/$branch
		echo "tracking origin/$tracking"
	}
	function github-init () {
		git config branch.$(git-branch-name).remote origin
		git config branch.$(git-branch-name).merge refs/heads/$(git-branch-name)
	}
	
	function github-url () {
		git config remote.origin.url | sed -En 's/git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'
	}
	
	# Seems to be the best OS X jump-to-github alias from http://tinyurl.com/2mtncf
	function github-go () {
		open $(github-url)
	}
	
	function nhgk () {
		nohup gitk --all &
	}
fi
