###############################################################################
# Mac installs                                                                #
###############################################################################

echo "Begin installs for $(whoami)"


# xcode-select install here?

echo "installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "brew install git & node/npm"
brew install git node 

echo "installing apps with brew cask"
brew install --cask alfred google-chrome visual-studio-code slack spectacle postman iterm2 docker

echo "install fonts"
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# TODO: how to add Dank Mono here?

echo "setup development environment"
brew install tmux neovim stow lazygit


