alias slt='open -a "Sublime Text"'
alias sshvps='ssh ip -p port'
alias ls='ls -GFh'
DARKBLUE='\033[0;34m'
export EDITOR=vim

function psgrep()
{
	        ps aux | grep -e $1
}

#alias iphone='ssh root@localhost -p 2222'

alias deploy='exec ~/Desktop/buildandsignanddeploy.sh'

function abspath() { pushd . > /dev/null; if [ -d "$1" ]; then cd "$1"; dirs -l +0; else cd "`dirname \"$1\"`"; cur_dir=`dirs -l +0`; if [ "$cur_dir" == "/" ]; then echo "$cur_dir`basename \"$1\"`"; else echo "$cur_dir/`basename \"$1\"`"; fi; fi; popd > /dev/null; }

