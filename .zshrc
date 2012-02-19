#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:terminal' auto-title 'yes'

# Set the plugins to load (see $OMZ/plugins/).
zstyle ':omz:load' plugin 'archive' 'git'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:prompt' theme 'sorin'

# This will make you shout: OH MY ZSHELL!
source "$HOME/.oh-my-zsh/init.zsh"

# Customize to your needs...
umask 002
setopt print_eight_bit
watch=(all)

alias API_LOCAL='export ADAMA_API_BASE=http://localhost:3000/api/v1/'
alias API_DEV='export ADAMA_API_BASE=http://adama-test.mediamath.com/api/v1/'
alias API_QA='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/qa/api/v1/'
alias API_STAGE='export ADAMA_API_BASE=https://apollo-stage.mediamath.com/stage/api/v1/'

function llib () {
    eval $(perl -I$HOME/bootstrap-perl5/lib/perl5 -Mlocal::lib="$1")
    echo $PERL_MM_OPT
}

[[ -e /Users/Chris/perl5/perlbrew/etc/bashrc ]] && source /Users/Chris/perl5/perlbrew/etc/bashrc
