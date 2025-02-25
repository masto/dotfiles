#
# Defines environment variables.
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# Turn off Apple's session hackery
export SHELL_SESSIONS_DISABLE=1

export EDITOR='emacsclient -t --alternate-editor='
export VISUAL='emacsclient -t --alternate-editor='

export DOTNET_ROOT=$HOME/.dotnet
export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"

# Add -F to quit if the contents fit on one screen
export LESS='-F -g -i -M -R -S -w -X -z-4'

export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export LS_COLORS='ln=35;40:ow=30;43'
