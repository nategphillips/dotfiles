# dotfiles

## How to Use

I use [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles, which pretty much amounts to having a local `~/dotfiles/` directory that holds the dotfiles, from which symlinks are created to point to the `~/.config/` directory. To install all dotfiles at once, do:

```bash
git clone git@github.com:nategphillips/dotfiles
cd dotfiles
stow .
```

To install one package at a time, just stow a package name:

```bash
stow nvim
```

