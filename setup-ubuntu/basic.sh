#!/usr/bin/env bash

sudo apt update && sudo apt upgrade -y
sudo apt install -y kitty-terminfo git zsh avahi-daemon nano
sudo systemctl enable --now ssh avahi-daemon
sh -c $(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

cat > ~/.zshrc <<EOF
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(
  git
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

alias pin="sudo apt install"
alias pout="sudo apt remove"
alias svc="sudo systemctl"
EOF
source ~/.zshrc
touch ~/.hushlogin