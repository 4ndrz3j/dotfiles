# Luke's config for the Zoomer Shell + Some twekas by mee


# git prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# time with seconds
time_with_seconds(){
    date +%T
}

setopt PROMPT_SUBST
autoload -U promptinit && promptinit
#Enable colors and change prompt:
autoload -U colors && colors
#Prompt
TRIANGLE="\uE0B0"
PROMPT='%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M%{$fg[white]%}:%{$fg[cyan]%}$(time_with_seconds) %{$fg[magenta]%}%~%{$fg[red]%}]%F{green}%}$(parse_git_branch)%{%F{none}%}$TRIANLGE%{$reset_color%}$%b '

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit -D
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# ctrl+left/right/ word hopping
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Home/End buttons
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line

# bind del to delete
bindkey "^[[3~" delete-char


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
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# some Aditional aliases

alias dockerpurge='docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)'
alias vim=nvim
alias o='xdg-open'
alias ls='ls --color=auto'
alias cal='cal --monday'
# Load zsh-syntax-highlighting; should be last.
source $ZDOTDIR/plugins/zsh-syntax-highlighting2/zsh-syntax-highlighting.zsh 2>/dev/null


