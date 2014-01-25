alias slt='open -a "Sublime Text 2"'
alias sshvps='ssh lambdan.com'
alias ls='ls -GFh'
DARKBLUE='\033[0;34m'
export EDITOR=vim

function psgrep()
{
	        ps aux | grep -e $1
}
