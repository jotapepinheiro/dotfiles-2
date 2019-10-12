#!/zsh
echo "Installing node"
brew install node@10
# echo 'export PATH="/usr/local/opt/node@10/bin:$PATH"' >> ~/.zshrc

echo "Installing watchman"
brew install watchman

echo "Installing yarn"
brew install yarn --ignore-dependencies

echo "Installing React Native CLI"
yarn global add react-native-cli

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

echo "Installing insomnia"
brew cask install insomnia

echo "Installing Reactotron"
brew cask install reactotron

echo "Installing MongoDB Compass"
brew cask install mongodb-compass
