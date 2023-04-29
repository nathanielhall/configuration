# Configuration
> This repository contains my personal configuration files. This includes setup scripts and dotfiles.

## Steps
- Run setup scripts to apply settings and installs.
- Clean $HOME (remove dotfiles such as `.zshrc`, `.vimrc`)
- Sync dotfiles from this repo using `stow` or `copy`.
- Perform manual steps listed below

## Setup Scripts
- `./setup/mac-settings.sh` to apply [macOS defaults](https://macos-defaults.com/)
- `./setup/mac-installs.sh` run installs using homebrew 
- `./setup/mac-dev.sh` to setup development environment
- `./setup/linux.sh` to run linux specific installs and settings (*work in progress)

## Dotfiles
> Use `stow` to create symlinks in $HOME on dotfiles. Otherwise, just run a copy script.
#### Stow
- `sync.sh` create symlinks using stow. This will synchonize the configuration project with home directory.
- `sync-remove.sh` to remove symlinks previously created for this project.

The 'sync-*.sh' files have dependency on the following environment variables. 
- DOTFILES=$HOME/configuration
- ZDOTDIR=$HOME
- STOW_FOLDERS="nvim, tmux, vim, zsh"
#### Copy
- `copy.sh` to manually copy dotfiles to $HOME directory


## Manual Steps
#### Install Font
- [Dank Mono](https://philpl.gumroad.com/l/dank-mono) (This is a paid font, therefore not committed in this repo)
- To build a new patched nerd font: [Nerd Fonts: Option 8 - Patch your own font](https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font)
  - $ `docker run -v ~/nerd-fonts/in:/in -v ~/nerd-fonts/out:/out nerdfonts/patcher --fontawesome --octicons`
#### iTerm Settings
- Font: Dank Mono Nerd Font; Regular; 13; 100; 115 (vertical spacing: 120)
- [Cobalt Theme by Wes Bos](https://github.com/wesbos/Cobalt2-iterm)
  - In iTerm2 access the Preferences pane on the Profiles tab. Under the Colors tab import the cobalt2.itermcolors file via the Load Presets drop-down.
#### Enabling italics in Terminal (optional)
- [Enabling italics in Vim and tmux](https://gist.github.com/gutoyr/4192af1aced7a1b555df06bd3781a722)
#### Mac System Settings
- Create shortcut for each desktop 1-5
  - System Settings > Keyboard > Keyboard Shortcuts > Mission Control > Switch to desktop
- Dvorak Keyboard Input
  - System Settings > Keyboard > Add Dvorak
- Faster desktop transitions?
  - Accessibility > Display > Reduce Motion
- Caps lock to function as escape key
  - System Settings > Keyboard > Keyboard Shortcuts > Modifier Keys > Caps Lock -> Escape


## Resources
- [macOS defaults list](https://macos-defaults.com/)
- [mathiasbynens dotfiles](https://github.com/mathiasbynens/dotfiles/blob/main/.macos)
- [chris@machine Neovim IDE from Scratch](https://www.youtube.com/watch?v=ctH-a-1eUME)
- Change cursor shape by mode [Luke Smith Zshrc](https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52)
- [FZF with tmux-sessionizer](https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer)

## Next Steps (Todo)
- Add more automation (research ansible for this)
- Finish `linux.sh` setup script
- Create a cleanup script to clean dotfiles in $HOME. Possibly move all dotfiles to backup directory. Afterwards, run `sync.sh` to create symlinks. Finally, remove backup if possible. Currently, this is a manual step.