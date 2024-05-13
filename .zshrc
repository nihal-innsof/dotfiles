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
zstyle :compinstall filename '/home/n1h41/.zshrc'

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
alias ls="ls -la"
alias gt="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias g="git"
alias cat="bat"
# alias x="/home/n1h41/development/bash/x.sh"

# Update path
export PATH=$PATH:/home/n1h41/lsp/lua-language-server/bin:/usr/bin/nvim/bin:/home/n1h41/go/bin

# Deno
# export DENO_INSTALL="/home/n1h41/.deno"
# export PATH="$DENO_INSTALL/bin:$PATH"
# export VSCODE_WINDOWS="/mnt/c/Users/nihal/AppData/Local/Programs/Microsoft VS Code/bin"
# export PATH="$PATH:$VSCODE_WINDOWS"
# source /home/n1h41/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Update path with flutter binaries
export PATH="$PATH:/usr/bin/flutter/bin"

# Add platform tools to the path
# export PATH="$PATH:/home/n1h41/Android/Sdk/platform-tools"

# Add go binaries to the path
export PATH="$PATH:/usr/local/go/bin"

# initialise zoxide
eval "$(zoxide init zsh)"

neofetch
