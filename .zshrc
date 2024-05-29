# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shawn-andrew/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

### Added by Zinit's installer
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

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init bash)"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab


# Keybindings
bindkey -e
bindkey '^ ' autosuggest-accept

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Integrations
# eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Other

# -- Setting Nvim to Default Editor --
export EDITOR="nvim"
export VISUAL="nvim"
# -- Aliases --
alias obsidian="open obsidian://"
alias ls="ls -a1 --color=auto --group-directories-first"
alias ll="ls -Al --color=auto --group-directories-first"

# # -- Add to path --
typeset -U path

PATH+=/opt/cmake/bin/:
PATH+=/home/shawn-andrew/randomprograms/vcpkg/:
PATH+=/home/shawn-andrew/Documents/randomprograms/python/python-3.12.2/:
PATH+=/usr/local/go/bin/:
PATH+=$home/.local/bin/:
PATH+=/opt/nvim/:
PATH+=/sbin/:
PATH+=/home/shawn-andrew/Documents/randomprograms/postman/Postman/app/:
PATH+=/home/shawn-andrew/.fzf/bin/:

# -- bindings

# -- Commands --
CONFIG_PATH="~/.config/"


# file fzf
alias sd="cd ~ && cd \"\$(find * -type d | fzf)\""
alias scd="cd \"\$(find * -type d | fzf)\""
alias scp="echo \"\$(find ~/* | fzf) | xclip -sel clip\""
alias snv="nv \"\$(find * | fzf)\""


# short nvim
alias nv="nvim"

# TMUX related Commands
alias tn="tmux new -s"
alias tc="tmux new -s Config -c ~/.config/"

tsn () {
    if [ $# -eq 0 ] ; then
        read -p "Please Input Session Name: " name
    fi

    local target=$(find ~/* -type d | fzf )

    if [ -z "${target}" ] ; then
        echo "No directory selected."
        return 1
    fi

    if [ -z "$name" ] ; then
        name=$target
    fi

    if [ ! "$TMUX" ] ; then
        tmux new -c "$target" -s ${1-$name}
    else
        tmux new -d -c "$target" -s ${1-$name}
        tmux switch -t "${1-$name}"
    fi
}

ta () {
    local target=$(tmux ls -F "#{session_name}" | fzf)
    if [ -z "${target}" ] ; then
        echo "No server selected"
    else
        if [ ! "$TMUX" ] ; then
            tmux detach
            tmux attach -t "$target"
        else
            tmux switch -t "$target"
        fi
    fi
}

# Makedir and CD
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
    cd $1
  else
    mkdir $1 && cd $1
  fi
}


# Tmux Sessions on Start
tmux new -c ~/.config -s Config -d
tmux new -c ~/Documents/programming -s Programming -d
tmux new -c ~/Documents/obsidian-notes -s Notes -d

clear


