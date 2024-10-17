# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Initialisations
eval "$(starship init zsh)"

# Lines configured by zsh-newuser-install
setopt autocd notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/nihal/.zshrc'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Plugins
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"
bindkey '^ ' autosuggest-accept

# INFO: Personal aliases
alias cls="clear"
alias vim="nvim"
alias lg="lazygit"
alias  l='eza -lh  --icons=auto' # long list
alias ls='eza -1   --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias gt="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias g="git"
alias tmux="tmux -u"
alias cat="bat"
alias lzd="lazydocker"
alias tr="tmuxinator"
alias mk="make"
alias tx="tmux"


# source /home/nihal/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Update path with flutter binaries
export PATH="/home/nihal/flutter/bin:$PATH"
export PATH="$PATH:/home/nihal/Android/Sdk/platform-tools"

# Go path
export PATH="$PATH:/usr/local/go/bin"

# Go executables path
export PATH="$PATH:/home/nihal/go/bin"
export PATH="$PATH:/opt/mssql-tools/bin"

# cargo installed apps path
export PATH="$PATH:/home/nihal/.cargo/bin"

# Android Studio Emulator
export PATH="$PATH:/home/nihal/Android/Sdk/emulator"

# initialise zoxide
eval "$(zoxide init zsh)"

# Initialise keychain
eval $(keychain --eval --quiet ~/.ssh/innsof-git)

source <(fzf --zsh)

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

export EDITOR="nvim"

# krabby random
# krabby name kyogre

#Display Pokemon
# pokemon-colorscripts --no-title -r 1,3,6
pokemon-colorscripts --no-title -n charmander -b

zstyle ':completion:*' menu select
fpath+=~/.zfunc
