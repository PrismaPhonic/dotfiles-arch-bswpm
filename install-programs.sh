#!/bin/sh

# Make sure system is fully up to date before adding new program
sudo pacman --noconfirm -Syu

# Install paru
git clone https://aur.archlinux.org/paru.gi ~/.srcs/paru
(cd ~/.srcs/paru/ && makepkg -si)

# Install lastpass
sudo pacman -S --noconfirm --needed lastpass-cli

# Install neovim
sudo pacman -S --noconfirm --needed neovim

# Install pip
sudo pacman -S --noconfirm --needed python-pip

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Setup vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Un-install previous Rust that may have been installed using manjaro community repo
sudo pacman -R rust

# Install rust
curl https://sh.rustup.rs -sSf | sh
source $HOME/.cargo/env

# Install nightly rust
rustup install nightly

# Install RLS
rustup component add rls rust-analysis rust-src

# Install ripgrep
cargo install ripgrep

# Install NVM
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

# Load NVM immediately into this term session.
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install Yarn
paru -S --noconfirm --needed yarn

# Install Node with NVM
nvm install node
nvm use node

# Install neovim npm module globally
npm install -g neovim

# Install instant markdown mini-server
npm install -g instant-markdown-d

# Setup git
git config --global user.name "Peter Farr"
git config --global user.email "Peter@PrismaPhonic.com"

# Install python neovim module
sudo pip3 install --upgrade pynvim

# Install Goland IDE
paru -S --noconfirm --needed goland

# Install and setup docker
paru -S --noconfirm --needed docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a pmfarr docker

# Install kubectl
paru -S --noconfirm --needed kubectl

# Install Slack
paru -S --noconfirm --needed slack-desktop

# Install Signal messenger
paru -S --noconfirm --needed signal-desktop

# Install Discord
sudo pacman -S --noconfirm --needed discord

# Install neofetch for coolness factor
paru -S --noconfirm --needed neofetch

# Install Thunderbird
paru -S --noconfirm --needed thunderbird

# Install Golang
./install-golang.sh

# Install mysql server and client tools
./install-mysql.sh

# Install newest kustomize
./install-kustomize.sh

# Install minikube & kvm deps
./install-minikube.sh

# Install operator-sdk deps
./install-operator-sdk-deps.sh
