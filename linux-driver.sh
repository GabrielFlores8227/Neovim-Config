#!/bin/bash

# Detect the package manager
if command -v apt >/dev/null; then
  package_manager="apt"
elif command -v yum >/dev/null; then
  package_manager="yum"
elif command -v dnf >/dev/null; then
  package_manager="dnf"
elif command -v pacman >/dev/null; then
  package_manager="pacman"
else
  echo "Package manager not found"
  exit 1
fi

# Install Python3
function python3Driver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt install -y python3 python3-pip
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y python3 python3-pip
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm python python-pip
  fi

  # Install Neovim Python package
  sudo python3 -m pip install neovim
}

# Install Yarn
function yarnDriver() {
    if [[ "$package_manager" == "apt" ]]; then
      sudo apt-get install -y yarn
    elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
      sudo $package_manager install -y yarn
    elif [[ "$package_manager" == "pacman" ]]; then
      sudo pacman -S --noconfirm yarn
    fi
}

# Install Node.js
function nodejsDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install -y nodejs
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo bash -
    sudo $package_manager install -y nodejs
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm nodejs npm
  fi
}

# Install Neovim
function neovimDriver() {
  # Install dependencies
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt install -y neovim python3-neovim
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y neovim python3-neovim
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm neovim python-neovim
  fi
}

# Install unzip using
function unzipDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y unzip
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y unzip
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm unzip
  fi
}

# Install nerd-fonts
function nerdFontsDriver() {
    TEMP=$(mktemp)
    wget -O $TEMP https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip && unzip $TEMP -d $HOME/.fonts
    fc-cache -fv
}

# Install vim-plug
function vimPlugDriver() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

# Install git 
function gitDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y git
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y git
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm git
  fi
}

# Install nvim-plugs
function nvimPlugsDriver() {
    mkdir -p $HOME/.config && mkdir -p $HOME/.config/nvim
    git clone https://github.com/GabrielFlores8227/nvim $HOME/.config/nvim
    rm -r $HOME/.config/nvim/assets && rm $HOME/.config/nvim/README.md $HOME/.config/nvim/deb-driver.sh 
}

function executeDriver() {
    	echo -e "\n\n\033[0;37;43m[*] Installing $1\033[m" \
      && eval $2 \
      && echo -e "\n\033[0;37;42m[v] $1 is installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp "" \
      || echo -e "\n\033[0;37;41m[x] $1 could not be installed | PRESS ENTER TO EXIT\033[0m" && read -sp ""
}

# Main
# Update packages information 
if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get update
elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo yum update
elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -Sy
fi

executeDriver "python" "python3Driver"
executeDriver "yarn" "yarnDriver"
executeDriver "node.js" "nodejsDriver"
executeDriver "neovim" "neovimDriver"
executeDriver "unzip" "unzipDriver"
executeDriver "nerd-fonts" "nerdFontsDriver"
executeDriver "vim-plug" "vimPlugDriver"
executeDriver "git" "gitDriver"
executeDriver "nvim-plugs" "nvimPlugsDriver"
