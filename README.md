# System and Application Configuration files, a.k.a. dotfiles

This is a collection of configuration files, a.k.a. dotfiles. The repository is named "dotfiles" since UNIX-like systems, configuration files start with a dot, `.`, to make them hidden in the user's `$HOME` directory. The convention for GitHub users that want to manage and organize their configuration files is to create a "dotfiles" repository, so this repository has been similarly named to follow the convention. The leading dot, `.`, has also been removed from the files to make the files visible within a terminal or file manager. The leading dot, `.`, should be added when setting up (linking) a new machine.

## Usage

The repository should be cloned into a reasonable location on the user's machine. The recommended location would be `$HOME/dotfiles`, or even better `$HOME/.dotfiles` if the user wants to hide the repository.

```
$ git clone https://github.com/volks73/dotfiles.git $HOME/.dotfiles
```

After the repository has been cloned, symbolic links should be created for each configuration file for the system or application-specific location. This can be accomplished using the `install.sh` script provided with the source code and run with:

```bash
$ cd $HOME/.dotfiles
$ install.sh
```

Or, the symbolic links can be created manually as follows:

Since the `-f` flag is used for the `ln` command, any previous files or links will be overwritten.

```bash
$ ln -sf $(pwd)/vim/vimrc $HOME/.vimrc
$ ln -sf $(pwd)/vim/gvimrc $HOME/.gvimrc
$ ln -sf $(pwd)/bash/bashrc $HOME/.bashrc
$ mkdir -p $HOME/.hammerspoon
$ ln -sf $(pwd)/hammerspoon/init.lua $HOME/.hammerspoon/init.lua
$ ln -sf $(pwd)/hammerspoon/url.lua $HOME/.hammerspoon/url.lua
$ mkdir -p $HOME/.config/karabiner
$ ln -sf $(pwd)/karabiner/karabiner.json $HOME/.config/karabiner
$ ln -sf $(pwd)/emacs/spacemacs $HOME/.spacemacs
```

