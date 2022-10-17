# Configuration
> My personal configuration files

## Setup files 
- `./setup/mac-settings.sh` to apply system settings for my Macbook
- `./setup/mac-installs.sh` to install required apps using homebrew
- `./setup/dev.sh` to setup development environment
- `sync.sh` create symlinks using stow. This will synchonize the configuration project with home directory.
- `sync-remove.sh` to remove symlinks previously created for this project.

The 'sync-*.sh' files have dependency on the following environment variables. 
- DOTFILES=$HOME/configuration
- ZDOTDIR=$HOME
- STOW_FOLDERS="nvim, tmux, vim, zsh"

### Enabling italics in Terminal
- [Enabling italics in Vim and tmux](https://rsapkf.xyz/weblog/enabling-italics-vim-tmux)

### Zsh Setup

- zsh-autosuggestions
- vi-mode
- change cursor shape by mode [Luke Smith Zshrc](https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52)

### iTerm Setup

- Dank Mono Font patched using font patcher with Docker: [Nerd Fonts: Option 8 - Patch your own font](https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font)
  - $ `docker run -v ~/nerd-fonts/in:/in -v ~/nerd-fonts/out:/out nerdfonts/patcher --fontawesome --octicons`
  - Font 14 (vertical spacing: 120)
- [Cobalt Theme by Wes Bos](https://github.com/wesbos/Cobalt2-iterm)
  - In iTerm2 access the Preferences pane on the Profiles tab. Under the Colors tab import the cobalt2.itermcolors file via the Load Presets drop-down.
