###############################################################################
# Development Environment Setup                                               #
###############################################################################

echo "create code directory"
mkdir -p "${HOME}/code"

# echo "generating an RSA token for GitHub"
# mkdir -p ~/.ssh
# touch ~/.ssh/config
# ssh-keygen -t rsa -b 4096 -C "nathaniel.hall@gmail.com"
# echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_rsa" | tee ~/.ssh/config
# eval "$(ssh-agent -s)"
# echo "run 'pbcopy < ~/.ssh/id_rsa.pub' and paste that into GitHub"

echo "cloning configuration files"
git clone git@github.com:nathanielhall/configuration.git "${HOME}/configuration"

# TODO: copy the .itermcolors file and commit
echo "cloning Cobalt2 theme for iTerm"
git clone https://github.com/wesbos/Cobalt2-iterm ~/.zsh/Cobalt2-iterm

echo "cloning zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# TODO: determine if this is still needed. I think Mason.nvim covers this.
echo "installing language servers for Neovim (Neovim LSP)"
npm i -g typescript typescript-language-server
npm install -g eslint_d

# brew install efm-langserver
gem install solargraph  
