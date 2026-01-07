# ===========================
# ZSH CONFIG WITH STARSHIP + ZINIT (FIXED)
# ===========================
#fastfetch
fastfetch
# --- Shell options ---
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt autocd
setopt correct
setopt hist_ignore_dups
setopt hist_ignore_space
setopt share_history

# --- Starship prompt ---
eval "$(starship init zsh)"

# --- Zinit plugin manager ---
if [[ ! -f ~/.local/share/zinit/zinit.git/zinit.zsh ]]; then
  mkdir -p ~/.local/share/zinit
  git clone https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit/zinit.git
fi
source ~/.local/share/zinit/zinit.git/zinit.zsh

# --- Plugins ---
# Core plugins
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab
zinit light rupa/z
zinit light wfxr/forgit

# Oh My Zsh plugins (valid ones)
zinit snippet OMZP::sudo
zinit snippet OMZP::extract
zinit snippet OMZP::git
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::command-not-found

# --- Pacman helpers (custom, since no OMZ pacman plugin) ---
#alias update='sudo pacman -Syu'
#alias install='sudo pacman -S'
#alias remove='sudo pacman -Rns'
#alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
#alias search='pacman -Ss'
#alias info='pacman -Qi'
#alias orphan='pacman -Qtdq'

# --- FZF setup ---
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# --- Aliases ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias gcm='git commit -m'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias gp='git push'
alias gc='git clone'

# --- Keybindings ---
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward

# --- PATH ---
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# --- End ---

