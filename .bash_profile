alias slt='open -a "Sublime Text 2"'
alias sshvps='ssh 46.16.232.23 -p x'
alias ls='ls -GFh'
alias irc='ssh -t 46.16.232.23 -p x "screen -rd irc"'
DARKBLUE='\033[0;34m'
export EDITOR=vim

function psgrep()
{
	        ps aux | grep -e $1
}
