# Load fastfetch on startup
fastfetch --config ~/.config/fastfetch/small.jsonc

autoload -U colors && colors

PS1="%B%{$fg[red]%}["
PS1="$PS1%{$fg[blue]%}%n"
PS1="$PS1%{$fg[white]%}@"
PS1="$PS1%{$fg[green]%}%M "
PS1="$PS1%{$fg[magenta]%}%~"
PS1="$PS1%{$fg[red]%}]"
PS1="$PS1%{$fg[yellow]%}#"
PS1="$PS1%{$reset_color%}%b "

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#67799c"
WORDCHARS=""
EDITOR=nvim

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.histfile
setopt share_history

alias vim="nvim"
alias ip="ip -c"
alias cat="batcat --theme='TwoDark' --plain --pager='never'"
alias ls="lsd --group-dirs first"
alias l="ls -A"
alias ll="ls -laFh"
alias l.="ls -d .*"
hh() { history 0 | grep --color "${*}" }
alias h="history 0"
alias mv="mv -i"
alias grep="grep --color"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias btop="btop --utf-force"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)
unsetopt nomatch

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^H' backward-kill-word
bindkey '^[[P' delete-char

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
