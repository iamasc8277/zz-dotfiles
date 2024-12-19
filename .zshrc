source /usr/share/zsh-antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle agkozak/zsh-z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle agkozak/agkozak-zsh-prompt
antigen apply

AGKOZAK_PROMPT_DIRTRIM=0
AGKOZAK_SHOW_VIRTUALENV=0
AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1
AGKOZAK_PROMPT_CHAR=( ❯ ❯ ❮ )
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' 'S')
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=249"

# custom
[[ -s "$HOME/.zshrc.custom" ]] && source "$HOME/.zshrc.custom"

# nvm
export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# perlbrew
[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

true
