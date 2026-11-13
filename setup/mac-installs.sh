###############################################################################
# Mac installs                                                                #
###############################################################################

# Things TODO manually (print at end of this script)
# - Add Dvorak keyboard input
# - Appearance - Dark

echo "Begin installs for $(whoami)"


# xcode-select install here?

echo "installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew install git & node/npm"
brew install git node 

echo "installing apps with brew cask"
# brew install --cask alfred google-chrome visual-studio-code slack spectacle postman iterm2 docker
brew install --cask \ 
alfred \
google-chrome \ 
visual-studio-code \
postman \
iterm2 
# spectacle \


echo "install fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# TODO: how to add Dank Mono here? 
# add font as private file? Email it?

echo "setup development environment"
brew install tmux neovim stow lazygit


# And, this?
# - Clone Config repo 
# - Node/NPM & any global npm packages
# - Zsh 
# - Vim (.vimrc)
# - Neovim 
# - VSCode 
# - Tmux 
# - Fonts
# - Terminal config
# - SSH Key
# - FZF & tmux sessionizer
