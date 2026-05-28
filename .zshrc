# ~/.zshrc file for zsh interactive shells.
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch
setopt notify
setopt numericglobsort
setopt promptsubst

# setopt correct
WORDCHARS='_-'
PROMPT_EOL_MARK=""

# PATH

for version in /home/user_replace/.local/share/gem/ruby/*/bin; do
[ -d "$version" ] && PATH="$PATH:$version"
done

export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/snap/bin:$HOME/.local/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH
export STARSHIP_CONFIG=~/.config/starship.toml

# Keybindings

bindkey -e
bindkey ' ' magic-space
bindkey '^U' backward-kill-line
bindkey '^K' kill-line
bindkey '^W' kill-whole-line
bindkey '^[[3;3~' kill-word
bindkey '^[[3~' delete-char
bindkey '^[[1;3C' forward-word
bindkey '^[[1;3D' backward-word
bindkey '^[[5~' beginning-of-buffer-or-history
bindkey '^[[6~' end-of-buffer-or-history
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[Z' undo

# Completion system

fpath=(/usr/share/zsh-completions/src $fpath)

autoload -Uz compinit
compinit -d ~/.cache/zcompdump

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' verbose true
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'l:|=* r:|=*'

# colores en completion

eval "$(dircolors -b)"
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# procesos kill bonitos

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# History

HISTFILE=~/.zsh_history
HISTSIZE=30
SAVEHIST=30
setopt sharehistory
setopt histignorealldups

alias history="history 0"

TIMEFMT=$'\nreal\t%E\nuser\t%U\nsys\t%S\ncpu\t%P'

# Prompt básico (mantengo tu lógica)

PROMPT='%n@%m:%~ %# '

# LS colors + aliases (UNIFICADO)

if [ -x /usr/bin/dircolors ]; then
eval "$(dircolors -b)"
alias ls='lsd --group-dirs=first'
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
fi

# herramientas

alias cat='bat'
alias catn='bat --style=plain'
alias catnp='bat --style=plain --paging=never'

alias icat='kitty +kitten icat'

# fzf

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# plugins opcionales

[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f /usr/share/zsh-sudo/sudo.plugin.zsh ] && source /usr/share/zsh-sudo/sudo.plugin.zsh
[ -f /etc/zsh_command_not_found ] && source /etc/zsh_command_not_found

# funciones

clearHistory(){ echo '' > ~/.zsh_history }
removeHistory(){ rm ~/.zsh_history }

source ~/Github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[command]='fg=#39ff14,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#00faff'
ZSH_HIGHLIGHT_STYLES[function]='fg=#ff00ff'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#0088ff'
ZSH_HIGHLIGHT_STYLES[path]='fg=#00faff'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#ff003c,bold'
ZSH_HIGHLIGHT_STYLES[argument]='fg=#c0caf5'
ZSH_HIGHLIGHT_STYLES[option]='fg=#00faff'

copy() {
  xclip -selection clipboard < "$1"
}

# starship
eval "$(starship init zsh)"

export LC_TIME="en_US.UTF-8"
export LS_COLORS='no-time-format'

# bun completions
[ -s "/home/sogma/.bun/_bun" ] && source "/home/sogma/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
