#
# Sets Oh My Zsh options.
#
# Authors:
#   Christopher Masto <chris@masto.com>
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
# The order matters.
zstyle ':omz:load' omodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'osx' \
  'archive' \
  'git' \
  'ruby' \
  'syntax-highlighting' \
  'prompt'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'masto'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

zstyle ':omz:module:syntax-highlighting' color 'yes'
zstyle ':omz:module:syntax-highlighting' highlighters \
  'main' \
  'brackets' \
  'pattern' \
  'cursor' \
  'root'

# Customize to your needs...
umask 002
setopt print_eight_bit
watch=(all)

# My environment variables
export PAGER=less
export ACK_PAGER=less
export CVS_RSH=ssh
export CLICOLOR=YES
export PERL5LIB="./extlib/lib/perl5/darwin-2level:./extlib/lib/perl5"
export ANT_OPTS="-Xms256m -Xmx256m"
export RSYNC_RSH=ssh
export BLOCKSIZE=K
export PERL_AUTOINSTALL=--defaultdeps
export ADAMA_NO_BACKUPS_RISK_LOSING_EVERYTHING=1

# Work around unintentional linking with Lion's libpq
export PGHOST=/tmp

alias API_LOCAL='export ADAMA_API_BASE=http://localhost:3000/api/v1/'
alias API_DEV='export ADAMA_API_BASE=http://adama-test.mediamath.com/api/v1/'
alias API_QA='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/qa/api/v1/'
alias API_STAGE='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/stage/api/v1/'

function llib () {
    eval $(perl -I$HOME/bootstrap-perl5/lib/perl5 -Mlocal::lib="$1")
    echo $PERL_MM_OPT
}

[[ -e /Users/Chris/perl5/perlbrew/etc/bashrc ]] && source /Users/Chris/perl5/perlbrew/etc/bashrc

[[ -e /usr/local/Cellar/grc ]] && source "`brew --prefix grc`/etc/grc.bashrc"
