# ─────────────────────────────────────────────
# Zsh Essentials
# ─────────────────────────────────────────────

export ZSH_DISABLE_COMPFIX=true

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt INC_APPEND_HISTORY       # Immediately append to history
setopt SHARE_HISTORY            # Share history across terminals
setopt AUTOCD                   # cd by typing directory name
setopt PUSHD_IGNORE_DUPS        # No duplicate dirs in pushd
setopt EXTENDED_GLOB            # Advanced globbing
setopt NO_BEEP                  # Disable terminal bell

# ─────────────────────────────────────────────
# Environment
# ─────────────────────────────────────────────

export EDITOR=nvim
export VISUAL=code
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ─────────────────────────────────────────────
# Prompt (Minimal + Git)
# ─────────────────────────────────────────────

autoload -Uz vcs_info

precmd() {
  vcs_info
}

setopt prompt_subst
PROMPT='%F{white}%n@%m%f %F{blue}%~%f ${vcs_info_msg_0_} %# '

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

# ─────────────────────────────────────────────
# Plugins (Autosuggestions + Syntax Highlighting)
# ─────────────────────────────────────────────

# Make sure you've cloned these:
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/zsh}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.config/zsh}/plugins/zsh-syntax-highlighting

[[ -f ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -f ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ─────────────────────────────────────────────
# Completion System
# ─────────────────────────────────────────────

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
compinit

# ─────────────────────────────────────────────
# LS_COLORS (for White Directories)
# ─────────────────────────────────────────────

export LS_COLORS="di=0;37"

# GNU `ls` uses --color=auto, so alias accordingly:
alias l='ls --color=auto -lh'
alias la='ls --color=auto -A'
alias ll='ls --color=auto -alF'

# ─────────────────────────────────────────────
# Aliases
# ─────────────────────────────────────────────

alias ..='cd ..'
alias ...='cd ../..'
alias cls='clear'
alias lg='lazygit'
alias py='python3'
alias pip='pip3'
alias jn='jupyter notebook'
alias jlab='jupyter lab'
alias update='sudo apt update && sudo apt upgrade'

# ─────────────────────────────────────────────
# Keybindings
# ─────────────────────────────────────────────

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward

# ─────────────────────────────────────────────
# Command Not Found Handler (Optional)
# ─────────────────────────────────────────────

command_not_found_handler() {
  echo "Command not found: $1"
}

# # ─────────────────────────────────────────────
# # Startup
# # ─────────────────────────────────────────────

# clear && echo "Welcome, $USER!"
