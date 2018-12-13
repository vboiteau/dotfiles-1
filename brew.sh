#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install bfg
brew install xz

# Install other useful binaries.
brew install git
brew install lua
brew install lynx
brew install ssh-copy-id
brew install tree
brew install ansible
brew install awscli 

#vboiteau
brew install bat
brew install chunkwm
brew install ctags
brew install curl
brew install fpp
brew install fzf
brew install gawk
brew install git-etandup
brew install googler
brew install gws
brew install highlight
brew install htop
brew install imagemagick
brew install mps-youtube
brew install plantuml
brew install ranger
brew install shpotify
brew install skhd
brew install tmux
brew install youtube-dl

# cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

brew cask install alfred
brew cask install caffeine
brew cask install dash
brew cask install docker
brew cask install dropbox
brew cask install font-fira-code-nerd-font-mono
brew cask install google-chrome
brew cask install harvest
brew cask install intellij-idea-ce
brew cask install iterm2
brew cask install java8
brew cask install kitematic
brew cask install lastpass
brew cask install macvim
brew cask install mpv
brew cask install postman
brew cask install robo-3t
brew cask install sketch
brew cask install slack
brew cask install spotify

# Remove outdated versions from the cellar.
brew cleanup
