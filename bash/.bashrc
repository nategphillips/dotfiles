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
alias chgrp='chgrp --preserve-root'

# check whether a command exists
_have() {
    command -v "$1" >/dev/null 2>&1
}

# print a step and run it
_step() {
    local desc="$1"
    shift

    printf '\n\033[1;34m==> %s\033[0m\n' "$desc"
    printf '\033[2m$'
    printf ' %q' "$@"
    printf '\033[0m\n'

    "$@"
}

# run a step only if the program exists
_check_step() {
    local prog="$1"
    local desc="$2"
    shift 2

    if _have "$prog"; then
        _step "$desc" "$@"
    else
        printf '\n\033[1;33m==> Skipping: %s (%s not found)\033[0m\n' "$desc" "$prog"
    fi
}

# update system
sysupdate() {
    _check_step yay "Update pacman/AUR packages" \
        yay -Syu || return

    _check_step tlmgr "Update TeX Live manager" \
        tlmgr update --self || return

    _check_step tlmgr "Update TeX Live packages" \
        tlmgr update --all || return

    _check_step rustup "Update Rust toolchains" \
        rustup update || return

    _check_step juliaup "Update Julia versions" \
        juliaup update || return

    printf '\n\033[1;32m==> sysupdate complete\033[0m\n'
}

# clean system
sysclean() {
    local cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"

    _step "Refresh sudo credentials" \
        sudo -v || return

    _check_step yay "Remove unneeded dependencies/orphans" \
        yay -Yc || return

    _check_step paccache "Clean pacman cache, keeping three most recent package versions" \
        paccache -rk3 || return

    _check_step paccache "Completely remove cached packages that are no longer installed" \
        paccache -ruk0 || return

    if [[ -d "$cache_dir" ]]; then
        _step "Clear user cache directory: $cache_dir" \
            find "$cache_dir" -mindepth 1 -maxdepth 1 -exec rm -rf -- {} + || return
    fi

    _check_step journalctl "Vacuum system and user journal to 7 days" \
        sudo journalctl --vacuum-time=7d || return

    printf '\n\033[1;32m==> sysclean complete\033[0m\n'
}

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
TEXLIVE=$HOME/texlive/2026
export PATH=$TEXLIVE/bin/x86_64-linux:$PATH
export MANPATH=$TEXLIVE/texmf-dist/doc/man:$MANPATH
export INFOPATH=$TEXLIVE/texmf-dist/doc/info:$INFOPATH
