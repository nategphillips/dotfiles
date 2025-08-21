#
# ~/.bashrc
#

# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# coloring
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# shortcuts
alias la='ls -la'
alias ll='ls -l'
alias cls='clear'
alias ff='fastfetch'
alias tm='tmux new -s vibecoding'

# safety nets
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='cggrp --preserve-root'

# browse manpages with vim
export MANPAGER='nvim +Man!'

# persistent ssh
eval "$(keychain -q --eval ~/.ssh/id_ed25519)"

# starship
eval "$(starship init bash)"
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# julia
export JULIA_NUM_THREADS=auto,auto

# rust
export PATH=$PATH:~/.cargo/bin

# texlive
TEXLIVE=$HOME/texlive/2025
export PATH=$TEXLIVE/bin/x86_64-linux:$PATH
export MANPATH=$TEXLIVE/texmf-dist/doc/man:$MANPATH
export INFOPATH=$TEXLIVE/texmf-dist/doc/info:$INFOPATH
