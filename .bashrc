# -- Setting Nvim to Default Editor --
export EDITOR="nvim"
export VISUAL="nvim"
# -- Aliases --
alias ls="ls -a1 --color=auto --group-directories-first"
alias ll="ls -Al --color=auto --group-directories-first"

# -- Add to path --
export PATH="/opt/cmake/bin/:$PATH"
export PATH="~/randomprograms/vcpkg/:$PATH"
export PATH="~/Documents/randomprograms/postman/Postman/:$PATH"
export PATH="~/Documents/randomprograms/Python/Python-3.12.2/:$PATH"
export PATH="/usr/local/go/bin/:$PATH"
export PATH="$HOME/.local/bin/:$PATH"
export PATH="/usr/bin/:$PATH"
export PATH="/opt/nvim/:$PATH"
export PATH="/sbin/:$PATH"
export PATH="~/Documents/randomprograms/postman/Postman/app/:$PATH"

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

# -- Coloring Shell --
PS1='\[\033[0;32m\]\u@\h:\[\033[0;34m\]\w\[\033[0m\]\$ '

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

# Script to us ls every cd
cd ()
{
  command cd "$@" && ls
}

# neofetch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shawn-andrew/Documents/randomprograms/google-cloud-cli/google-cloud-sdk/path.bash.inc' ]; then . '/home/shawn-andrew/Documents/randomprograms/google-cloud-cli/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/shawn-andrew/Documents/randomprograms/google-cloud-cli/google-cloud-sdk/completion.bash.inc' ]; then . '/home/shawn-andrew/Documents/randomprograms/google-cloud-cli/google-cloud-sdk/completion.bash.inc'; fi

# Zoxide
# eval "$(zoxide init bash)"


clear
