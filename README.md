# Configuration

> All the files needed to setup a new machine and synchonize dotfiles across devices.

### Setup new machine

- Run `.macos.sh` to setup development environment and apply system configurations
- Run `install.sh` to create symlinks to my dotfiles using [Stow](https://www.kabisa.nl/tech/how-to-manage-dotfiles-with-gnu-stow)

### Synchronize dotfiles

- All dotfiles are located here, `${HOME}/configuration`
- Push changes, and pull from other devices

### Setup Dotfiles only

> files for Neovim, Tmux, Zsh, and VSCode

```
brew install neovim tmux stow

git clone git@github.com:nathanielhall/configuration.git "${HOME}/configuration"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

npm i -g typescript typescript-language-server
npm install -g eslint_d
brew install efm-langserver
```

- Remove any existing files since these will become symlinks (e.g., .zshrc, .zprofile, .tmux.config)
- Run `./install.sh` to stow folders defined in `$STOW_FOLDERS`

### Neovim using Cobalt2 Theme + Tmux

<img src="screenshot.png" alt="App Screenshot" title="App Screenshot" width="900" />

### Zsh Setup

- zsh-autosuggestions
- vi-mode
- change cursor shape by mode [Luke Smith Zshrc](https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52)

### iTerm Setup

- Dank Mono Font patched using font patcher with Docker: [Nerd Fonts: Option 8 - Patch your own font](https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font)
  - $ `docker run -v ~/nerd-fonts/in:/in -v ~/nerd-fonts/out:/out nerdfonts/patcher --fontawesome --octicons`
  - Font 14 (vertical spacing: 120)
- [Cobalt Theme by Wes Bos](https://github.com/wesbos/Cobalt2-iterm)
  - In iTerm2 access the Preferences pane on the Profiles tab.
  - Under the Colors tab import the cobalt2.itermcolors file via the Load Presets drop-down.

#### Todo

- [ ] Remove
