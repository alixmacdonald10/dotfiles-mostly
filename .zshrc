# To set this as the zshrc symlink to the config location they must be on the same partition
# ln -s <REPO LOCATION> ~/.zshrc


# set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# download zinit if its not there already
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

# add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# load completions
autoload -U compinit && compinit


# add in starship
export STARSHIP_CONFIG=~/data/repo/starship-config/starship.toml
eval "$(starship init zsh)"


# path mods
path+=('/home/amac/.cargo/bin')
export PATH

# keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory # shares histroy accross sessions
setopt hist_ignore_space  # doesnt save to hist if space before line good for secrets.
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no # disables default zsh completion menu in favour of fzf
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath -a' # add preview of dirs
zstyle ':fzf-tab:complete:__zoxide__z:*' fzf-preview 'exa $realpath -a'

# aliases
alias ls='exa -a -l'

# shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"



