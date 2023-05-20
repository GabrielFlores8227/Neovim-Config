#!/bin/bash

#---Detector-----------------------------------------------------------------------------------------
# Detect the package manager
if command -v apt >/dev/null; then
  package_manager="apt"
elif command -v yum >/dev/null; then
  package_manager="yum"
elif command -v dnf >/dev/null; then
  package_manager="dnf"
elif command -v pacman >/dev/null; then
  package_manager="pacman"
elif command -v zypper >/dev/null; then
  package_manager="zypper"
elif command -v brew >/dev/null; then
  package_manager="brew"
else
  echo -e "\n\033[0;37;41m[x] Package manager not found\033[0m"
  exit 1
fi

#---Functions----------------------------------------------------------------------------------------
# Install Python3
function python3Driver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt install -y python3 python3-pip
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y python3 python3-pip
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm python python-pip
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y python3 python3-pip
  elif [[ "$package_manager" == "brew" ]]; then
    brew install python3
  fi

  # Install Neovim Python package
  sudo python3 -m pip install neovim
  python3 -m pip install jedi
}

#Install Curl
function curlDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt install -y curl
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y curl
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm curl
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y curl
  elif [[ "$package_manager" == "brew" ]]; then
    brew install curl
  fi
}

# Install Node.js
function nodejsDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get install -y nodejs
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    curl -fsSL https://rpm.nodesource.com/setup_lts.x | sudo bash -
    sudo $package_manager install -y nodejs
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm nodejs npm
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y nodejs
  elif [[ "$package_manager" == "brew" ]]; then
    brew install node
  fi
}

# Install Neovim
function neovimDriver() {
  if [[ "$package_manager" == "brew" ]]; then
    curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos.tar.gz \
    && tar xzf nvim-macos.tar.gz \
    && ./nvim-macos/bin/nvim
  else
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage \
    && chmod u+x nvim.appimage \
    && ./nvim.appimage --appimage-extract \
    && ./squashfs-root/AppRun --version \
    && sudo mv squashfs-root / \
    && sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
  fi
}

# Install Yarn
function yarnDriver() {
    if [[ "$package_manager" == "apt" ]]; then
      sudo apt-get install -y yarn
    elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
      curl -sL https://dl.yarnpkg.com/rpm/yarn.repo | sudo tee /etc/yum.repos.d/yarn.repo && sudo $package_manager install yarn
    elif [[ "$package_manager" == "pacman" ]]; then
      sudo pacman -S --noconfirm yarn
    elif [[ "$package_manager" == "zypper" ]]; then
      curl -o- -L https://yarnpkg.com/install.sh | bash && source ~/.bashrc
    elif [[ "$package_manager" == "brew" ]]; then
      brew install yarn
    fi
}

# Install Unzip
function unzipDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y unzip
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y unzip
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm unzip
elif [[ "$package_manager" == "zipper" ]]; then
    sudo zipper install unzip
  elif [[ "$package_manager" == "brew" ]]; then
    brew install unzip
  fi
}

# Install Wget
function wgetDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get update \
    && sudo apt-get install -y wget
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y wget
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm wget
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y wget
  elif [[ "$package_manager" == "brew" ]]; then
    brew install wget
  fi
}

# Install Nerd-Fonts
function nerdFontsDriver() {
    TEMP=$(mktemp)
    if [[ "$package_manager" == "brew" ]]; then
        curl -L -o $TEMP https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip && unzip $TEMP -d $HOME/Library/Fonts/
    else
        wget -O $TEMP https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip && unzip $TEMP -d $HOME/.fonts
    fi
}

# Install Vim-Plug
function vimPlugDriver() {
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

# Install Git
function gitDriver() {
  if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get install -y git
  elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo $package_manager install -y git
  elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -S --noconfirm git
  elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper install -y git
  elif [[ "$package_manager" == "brew" ]]; then
    brew install git
  fi
}

# Install Neovim-Plugs
function nvimPlugsDriver() {
    git clone https://github.com/GabrielFlores8227/nvim $HOME/.config/nvim && sudo find $HOME/.config/nvim -type f ! -name "*.vim" -exec rm {} +

}

function executeDriver() {
      echo -e "\n\n\033[0;37;43m[*] Installing $1\033[m" \
      && eval $2 \
      && echo -e "\n\033[0;37;42m[v] $1 is installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp "" \
      || echo -e "\n\033[0;37;41m[x] $1 could not be installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp ""
}

#---Main---------------------------------------------------------------------------------------------
if [[ "$package_manager" == "apt" ]]; then
    sudo apt-get update
elif [[ "$package_manager" == "yum" || "$package_manager" == "dnf" ]]; then
    sudo yum update
elif [[ "$package_manager" == "pacman" ]]; then
    sudo pacman -Sy
elif [[ "$package_manager" == "zypper" ]]; then
    sudo zypper refresh
elif [[ "$package_manager" == "brew" ]]; then
    brew update
fi


executeDriver "python" "python3Driver"
executeDriver "curl" "curlDriver"
executeDriver "node.js" "nodejsDriver"
executeDriver "yarn" "yarnDriver"
executeDriver "neovim" "neovimDriver"
executeDriver "unzip" "unzipDriver"
executeDriver "wget" "wgetDriver"
executeDriver "nerd-fonts" "nerdFontsDriver"
executeDriver "vim-plug" "vimPlugDriver"
executeDriver "git" "gitDriver"
executeDriver "nvim-plugs" "nvimPlugsDriver"
