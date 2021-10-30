### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk
#
zinit light "peterhurford/git-aliases.zsh"
zinit light "agkozak/agkozak-zsh-prompt"
zinit light "zsh-users/zsh-autosuggestions"
zinit light "zsh-users/zsh-syntax-highlighting"

export PATH="$HOME/mytools/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# taken from https://github.com/Aloxaf/dotfiles/blob/master/zsh/.config/zsh/zshrc.zsh
zinit wait="0" lucid light-mode for larkery/zsh-histdb
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

