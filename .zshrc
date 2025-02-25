#
# Executes commands at the start of an interactive session.
#

# Settings required before loading zplug
export NVM_AUTO_USE=true

# Plugins are in .zplug_packages.zsh
ZPLUG_LOADFILE="$HOME/.zplug_packages.zsh"
source ~/.zplug/init.zsh

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check --verbose; then
    echo "To fix this, run 'zplug install'."
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zplug load

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Aliases
alias jd='dirs -v; jobs'
alias lt='lsd --tree --ignore-glob=node_modules --ignore-glob=.git'

# Customizations
watch=(all)
export BLOCKSIZE=K

eval "$(fzf --zsh)"
eval "$(fasd --init auto)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# pyenv for managing multiple python installations
if [ -f "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

#
# Completion settings for fzf-tab that don't work in .zpreztorc
#

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false

# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab
# will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' format '[%d]'

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# force zsh not to show completion menu, which allows fzf-tab to
# capture the unambiguous prefix
zstyle ':completion:*' menu no

# Favorite base16 themes:
# helios
# monokai
# material-darker
# atelier-dune
# atelier-seaside
# tube
# base16_horizon-terminal-dark
