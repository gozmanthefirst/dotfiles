# ============================================================
# History Configuration
# ============================================================
HISTSIZE=5000                  # Keep 5000 lines of history
SAVEHIST=$HISTSIZE             # Save history to ~/.zsh_history
HISTFILE=~/.zsh_history        # File to store history
HISTDUPE=erase                 # Erase duplicates
setopt appendhistory           # Append history to the file
setopt sharehistory            # Share history between sessions
setopt hist_ignore_space       # Ignore commands starting with space
setopt hist_ignore_all_dups    # Ignore all duplicate commands
setopt hist_save_no_dups       # Do not save duplicate entries
setopt hist_ignore_dups        # Ignore duplicates when searching
setopt hist_find_no_dups       # Ignore duplicates in history search

# ============================================================
# Keybindings
# ============================================================
# [Ctrl-RightArrow] - Move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - Move backward one word
bindkey '^[[1;5D' backward-word

# ============================================================
# Starship Prompt
# ============================================================
eval "$(starship init zsh)"

# ============================================================
# Environment Variables
# ============================================================
# PostgreSQL database password
export DATABASE_PASSWORD="xtian__XANDER123"

# Go
if [ -d "/usr/local/go/bin" ] ; then
    PATH="/usr/local/go/bin:$PATH"
fi
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Add user-specific binaries to PATH
export PATH="$HOME/.local/bin:$PATH"
PATH=~/.console-ninja/.bin:$PATH

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ============================================================
# Aliases
# ============================================================
alias ls="ls --color"
alias ll="ls -la"
alias la="ls -a"
alias c="clear"

alias g="git"

# NPM
alias nrd="npm run dev"
alias nrb="npm run build"
alias nrs="npm run start"

# PNPM
alias pnd="pnpm dev"
alias pnb="pnpm build"
alias pns="pnpm start"

alias sshr=""
alias sshg=""

# ============================================================
# Zinit Plugin Manager
# ============================================================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Zinit Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Shell Integrations
eval "$(zoxide init --cmd cd zsh)"

# Completion Styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:completion:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:completion:__zoxide_z:*' fzf-preview 'ls --color $realpath'
