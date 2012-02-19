# zsh startup

# Function to set colors from termcap
function Sf () {
	echotc me
	[[ $1 != '-' ]] && echotc AF $1
	[[ -n $2 && $2 != '-' ]] && echotc AB $2
	[[ $3 -ne 0 ]] && echotc md
}

# Try to work around bug in terminal initialization
#sleep 1

[[ "$COLORTERM" == "gnome-terminal" ]] && export TERM=xterm-color

# [[ "$TERM_PROGRAM" == "Apple_Terminal" ]] && export TERM=dtterm

if [[ "$TERM" == "xterm-color" ]]; then
  function precmd () {
	  print -Pn "\e]0;%~ %m\a"
  }

  function preexec () {
	  local cmd
	  cmd=($2)
	  print -Pn "\e]0;"${${(z)cmd}[1,2]}" - zsh\a"
#         print -Pn "\e]0;${${(@z)*}[1,2]} - zsh\a"
#         print -Pn "\e]0;${${(@z)*}[@]} - zsh\a"
  }
fi

# svn prompt
__vcs_dir() {
  local vcs base_dir sub_dir ref

  sub_dir() {
    local sub_dir
    sub_dir=$(greadlink -f "${PWD}")
    sub_dir=${sub_dir#$1}
    echo ${sub_dir#/}
  }

  svn_dir() {
    [ -d ".svn" ] || return 1
    base_dir="."
    while [ -d "$base_dir/../.svn" ]; do base_dir="$base_dir/.."; done
    base_dir=$(greadlink -f "$base_dir")
    sub_dir=$(sub_dir "${base_dir}")
    ref=$(svn info "$base_dir" | awk '/^URL/ { sub(".*/","",$0); r=$0 } /^Revision/ { sub("[^0-9]*","",$0); print r":"$0 }')
    vcs="svn"
  }

  svn_dir ||
  base_dir="$PWD"

  echo "${base_dir/$HOME/~}${vcs:+%{`Sf 3 4 1`%\}[$ref]%{`Sf 6 4 1`%\}${sub_dir}}"
}

if [[ "$TERM" == "dumb" ]]; then
  PS1='%(!.#.$) '
else
  PS1=%{%(\!.`Sf 6 1`.`Sf 6 4`)%}%n%{%(\!.`Sf 7 1`.`Sf 7 4`)%}@%{%(\!.`Sf 3 1 1`.`Sf 3 4 1`)%}%m%{%(\!.`Sf 7 1`.`Sf 7 4`)%}:%{%(\!.`Sf 6 1 1`.`Sf 6 4 1`)%}'$(__vcs_dir)'%{%(\!.`Sf 1 0 1`.`Sf 2 0 1`)%}%(\!.#.\$)%{`Sf - - 0`%}' '
fi
setopt prompt_subst

# file permissions: rwxr-xr-x
umask	002

bindkey -e
setopt print_eight_bit

zmodload zsh/complist

#export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/X11R6/bin:/usr/local/bin:~/bin
export BLOCKSIZE=K
export EDITOR=emacs
export PAGER=less
export LESS=-iMXR
export CVS_RSH==ssh
export RSYNC_RSH==ssh
export CLICOLOR=YES
export PERL_AUTOINSTALL=--defaultdeps
export ANT_OPTS="-Xms256m -Xmx256m"
#export PERL5LIB="./extlib/lib/perl5/darwin-2level:./extlib/lib/perl5"
export ADAMA_NO_BACKUPS_RISK_LOSING_EVERYTHING=1

# Work around unintentional linking with Lion's libpq
export PGHOST=/tmp

watch=(all)
typeset -U path
path=(~/bin /sbin /usr/sbin /usr/local/pgsql/bin /usr/local/bin /usr/local/sbin $path /Developer/Tools)
[[ -e /opt ]] && path=(/opt/local/bin /opt/local/sbin /opt/local/share/bin $path)
[[ -e /usr/local/mysql/bin ]] && path=($path /usr/local/mysql/bin)

alias ls='ls -Fv'
alias jd='jobs; dirs'
alias move_torrent='scp *.torrent frylock.local: && rm *.torrent && ssh frylock.local'
alias em='open -a Emacs'
#alias fixecho='sudo route delete 192.168.0.0; sudo route add 192.168.0.0 -netmask 255.255.0.0 192.168.1.254'

alias API_LOCAL='export ADAMA_API_BASE=http://localhost:3000/api/v1/'
alias API_DEV='export ADAMA_API_BASE=http://adama-test.mediamath.com/api/v1/'
alias API_QA='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/qa/api/v1/'
alias API_STAGE='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/stage/api/v1/'

function llib () {
    eval $(perl -I$HOME/bootstrap-perl5/lib/perl5 -Mlocal::lib="$1")
    echo $PERL_MM_OPT
}

# The following lines were added by compinstall
autoload -U compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select=0
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/chris/.zshrc'
# End of lines added by compinstall

ssh_hosts=(
    # This gets known hosts from ssh:
    # un-comment line(s) below to use this.
    $(cat ~/.ssh/known_hosts | cut -f 1 -d " " | cut -f 1 -d , 2> /dev/null)
)
zstyle ':completion:*' hosts $ssh_hosts

[[ -e /sw/bin/init.sh ]] && source /sw/bin/init.sh

[[ -e /Users/Chris/perl5/perlbrew/etc/bashrc ]] && source /Users/Chris/perl5/perlbrew/etc/bashrc
