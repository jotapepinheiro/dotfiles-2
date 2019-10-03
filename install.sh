# VIM
echo "Symlinking things:"

ln -s $(pwd)/.vimrc ~/.vimrc
ln -s $(pwd)/.vim ~/.vim
ln -s $(pwd)/.gitconfig ~/.gitconfig
ln -s $(pwd)/.zshrc ~/.zshrc
ln -s $(pwd)/.tmux.conf ~/.tmux.conf

# BINARIES
echo "Installing binaries:"

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing chrome"
brew cask install google-chrome

echo "Installing VS Code"
brew cask install visual-studio-code

echo "Installing VLC"
brew cask install vlc

echo "Installing AWS CLI"
brew install awscli

echo "Installing ffmpeg"
brew install ffmpeg

echo "Installing imagemagick"
brew install imagemagick

echo "Installing docker"
brew cast install docker

echo "Installing Font Fira-Code"
brew tap homebrew/cask-fonts && brew cask install font-fira-code

echo "Installing node"
brew install node

echo "Installing insomnia"
brew cask install insomnia

echo "Installing Reactotron"
brew cask install reactotron

echo "Installing MongoDB Compass"
brew cask install mongodb-compass

echo "Installing Android Studio"
brew cask install android-studio

echo "Making Zsh the default shell"
chsh -s $(which zsh)

echo "Installing Oh My Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Appending custom .zshrc tail... remember to change the theme to 'spaceship'"
cat $(pwd)/.zshrc_tail >> ~/.zshrc

echo "Installing zplugin"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

echo "Installing spaceship prompt"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"

echo "Simlink spaceship"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Done!"
