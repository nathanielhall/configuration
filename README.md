# Configuration Files (dotfiles)
> The purpose of this repo is to manage my dotfiles using stow.

### Neovim + Tmux
```
brew install neovim tmux stow
```

```
git clone git@github.com:nathanielhall/configuration.git "${HOME}/configuration"
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
```

```
npm i -g typescript typescript-language-server
npm install -g eslint_d
brew install efm-langserver
```

Run `./install.sh` to stow folders defined in `$STOW_FOLDERS`
- Remove any existing files since these will become symlinks (e.g., .zshrc, .zprofile, .tmux.config)


## Resources
[DONT DO THAT WITH YOUR DOTFILES (DO THIS)](https://youtu.be/tkUllCAGs3c)

[How to manage dotfiles with GNU Stow](https://www.kabisa.nl/tech/how-to-manage-dotfiles-with-gnu-stow/)

### Zsh Configuration
- zsh-autosuggestions
- vi-mode 
  - change cursor shape by mode [Luke Smith Zshrc](https://gist.github.com/LukeSmithxyz/e62f26e55ea8b0ed41a65912fbebbe52)


### VSCode Configuration Improvements
> Goal: improve VIM experience 
- Ability to use keyboard for source control/git using sidebar (stage changes, commit, .etc)
- Easily navigate and split panes
- (Work in progress..)