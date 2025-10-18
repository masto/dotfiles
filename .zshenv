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

export LS_COLORS='di=34:ln=35;40:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {} 2>/dev/null'"
export FZF_ALT_C_OPTS="--preview 'lsd --icon=always --tree --color=always {} 2>/dev/null | head -200'"

# Disable pagers when the terminal is launched by Cline
if [[ -n "$CLINE_ACTIVE" ]]; then
  export PAGER=cat
  export GIT_PAGER=cat
  export SYSTEMD_PAGER=cat
  export LESS="-FRX"
fi
