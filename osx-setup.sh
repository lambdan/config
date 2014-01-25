# install homebrew(brew)
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install wget
brew install ssh-copy-id

# download .vimrc and .bash_profile into ~
wget -O ~/.vimrc https://raw.github.com/lambdan/config/master/.vimrc --no-check-certificate

wget -O ~/.vimrc https://raw.github.com/lambdan/config/master/.bash_profile --no-check-certificate

echo "Everything should be done."
