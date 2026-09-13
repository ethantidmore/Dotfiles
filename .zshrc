#\____    / /   _____//   |   \ 
#  /     /  \_____  \/    ~    \
# /     /_  /        \    Y    /
#/_______ \/_______  /\___|_  / 
#        \/        \/       \/  

# If using MacOS change /home/ to /Users/

# Enables colors

autoload -U colors && colors

# Autocomplete settings

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# PS1

PS1="%B%{$fg[black]%}[%{$fg[white]%}%n%{$fg[yellow]%}@%{$fg[white]%}%M %{$fg[yellow]%}%~%{$fg[black]%}]%{$fg[white]%}$%b "

# History
HISTFILE=~/.zsh_history       
HISTSIZE=10000               
SAVEHIST=10000 

# Aliases

alias copy="xclip -selection clipboard"
alias ls='eza'
alias la='eza -a'
alias ll='eza -la'
alias grep='grep --color=auto'
alias vimrc='vim /home/$USER/.vimrc'
alias zshrc='vim /home/$USER/.zshrc'

# Add a extra nonroot path for this user

export PATH=/home/$USER/.local/bin:$PATH

# Toolchains

export PATH="$HOME/toolchains/loongarch64-linux/bin:$PATH"
export PATH="$HOME/toolchains/riscv64-linux/bin:$PATH"

# Plugins

source /usr/share/zsh/plugins/zsh-colored-man-pages/zsh-colored-man-pages.zsh 

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# For MacOS

#export PATH=/opt/homebrew/bin:$PATH

#source /opt/homebrew/share/zsh-colored-man-pages/zsh-colored-man-pages.zsh # I did this myself manually

#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
