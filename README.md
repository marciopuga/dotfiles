# dotfiles

> you are your dotfiles.

[GNU Stow](https://www.gnu.org/software/stow/) is a symlink farm manager, useful for automatically (and safely) linking your dotfiles folder into your home directory.

enter the dotfiles directory

    cd dotfiles

install the zsh settings

    stow zsh

install zsh settings for the root user

    sudo stow zsh -t /root

uninstall tmux

    stow -D tmux

install vim ignoring .DS_Store

    stow --ignore ".DS_Store" vim

etc, etc, etc...
