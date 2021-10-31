# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh
#

zcomet load "peterhurford/git-aliases.zsh"
zcomet load "agkozak/agkozak-zsh-prompt"
zcomet load "zsh-users/zsh-autosuggestions"
zcomet load "zsh-users/zsh-syntax-highlighting"

export PATH="$HOME/mytools/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# taken from https://github.com/Aloxaf/dotfiles/blob/master/zsh/.config/zsh/zshrc.zsh
zcomet load larkery/zsh-histdb
zcomet compinit

_zsh_autosuggest_strategy_histdb_top() {
    local query="
        select commands.argv from history
        left join commands on history.command_id = commands.rowid
        left join places on history.place_id = places.rowid
        where commands.argv LIKE '$(sql_escape $1)%'
        group by commands.argv, places.dir
        order by places.dir != '$(sql_escape $PWD)', count(*) desc
        limit 1
    "
    suggestion=$(_histdb_query "$query")
}

ZSH_AUTOSUGGEST_STRATEGY=(histdb_top match_prev_cmd completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=1


AGKOZAK_COLORS_BRANCH_STATUS=248
AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1
# Make the unicode prompt character red when superuser
# and reversed when in vi command mode
AGKOZAK_PROMPT_CHAR=( '%F{magenta}❯%f' '%F{red}❯%f' '%F{magenta}❮%f' )
AGKOZAK_CUSTOM_SYMBOLS=( '⇣⇡' '⇣' '⇡' '+' 'x' '!' '>' '?' )
AGKOZAK_USER_HOST_DISPLAY=1

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

ZSH_AUTOSUGGEST_MANUAL_REBIND=0

setopt auto_list
setopt auto_menu
setopt cdable_vars
zstyle ':completion:*:default' menu select=1
HISTFILE=$HOME/.zsh-history
HISTSIZE=2000
SAVEHIST=2000
setopt share_history

alias ls=lsd
alias v=nvim

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export DISPLAY=export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
export PATH="$PATH:$HOME/.cargo/bin"
export GDK_SCALE=2

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm() {
  echo "!! NVM not loaded !! Loading now..."
  unset -f nvm
  export [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  nvm "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Downloads/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Downloads/google-cloud-sdk/completion.zsh.inc"; fi

export GOPATH=$HOME/go
export PATH="$PATH:$HOME/go/bin"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
#

export MCFLY_FUZZY=true
export MCFLY_INTERFACE_VIEW=BOTTOM
eval "$(mcfly init zsh)"
eval "$(zoxide init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

