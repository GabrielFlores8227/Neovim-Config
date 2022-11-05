#!/bin/bash
clear
sudo apt-get update
clear

#---handle python3 & pip---
echo -n "[*] Checking Python3"

if command -v python3 &> /dev/null 
then
    echo -e ":\033[1;32m Python3 is installed\033[0m"
else
    echo -e ":\033[1;31m Python3 is not installed\033[0m"
    echo -e "\033[0;32m[+] Installing Python3\033[m"
    sudo apt-get install python3 python3-pip 
fi

#---handle node & npm---
echo -ne "\n[*] Checking Node.js"

if command -v node &> /dev/null
then
    echo -e ":\033[1;32m Node.js is installed\033[0m"
else
    echo -e ": \033[1;31m Node.js is not installed\033[0m"
    echo -e "\033[0;32m[+] Installing Node.js\033[0m | source: https://deb.nodesource.com/setup_19.x"
    curl -fsSL "https://deb.nodesource.com/setup_19.x" | sudo -E bash - && sudo apt-get install -y nodejs
fi

#---handle yarn---
echo -ne "\n[*] Checking Yarn"

if command -v yarn &> /dev/null
then
    echo -e ":\033[1;32m Yarn is installed\033[0m"
else
    echo -e ": \033[1;31m Yarn is not installed\033[0m"
    echo -e "\033[0;32m[+] Installing Yarn\033[0m"
    sudo apt-get install yarn
fi

#---handle nvim---
echo -ne "\n[*] Checking Neovim"
if command -v nvim &> /dev/null
then
    echo -e ":\033[1;32m Neovim is installed\033[0m"
else
    echo -e ": \033[1;31m Neovim is not installed\033[0m" 
    echo -e "\033[0;32m[+] Installing nvim\033[0m"
    sudo apt-get install neovim 
fi

#---handle font 3270---
echo -e "\n"

while true;
do
    read -p "[>] Install Nerdfonts? [y/n]: " USER_INPUT

    if [ "$USER_INPUT" = "y" ] || [ "$USER_INPUT" = "Y" ]
    then
        [[ ! -f "./3270.zip" ]] && sudo wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip"
        unzip "./3270.zip" -d "$HOME/.fonts" && fc-cache -fv 
        break
    elif [ "$USER_INPUT" = "n" ] || [ "$USER_INPUT" = "N" ]
    then
        break
    else
        echo -e "\033[0;31m[x] please use only 'y' or 'n'\033[0m" && sleep 2
        for ((i=0; i<2; i++))
        do
            tput cuu1 && tput el
        done
    fi
done

#---handle vim-plug---
echo -ne "\n[*] Checking Vim-Plug"

if [[ ! -d "$HOME/.local/share/nvim" ]]
then
    echo -e "\033[0;32m[+] Installing Vim-Plug\033[0m | source: https://github.com/junegunn/vim-plug"
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || exit 1
else
    echo -e ":\033[0;32m Vim-Plug is installed\033[0m"
fi

#---handle init.vim---
[[ ! -d "$HOME/.config" ]] mkdir "$HOME/.config"
[[ ! -d "$HOME/.config/nvim" ]] mkdir "$HOME/.config/nvim"
[[ ! -f "$HOME/.config/nvim/init.vim" ]] && mv "./init.vim" "$HOME/.config/nvim" && echo -e "\033[0;32m[+] All setup, execute :PlugInstall and enjoy coding!\033[0m" || echo -e "\033[0;31m[x] init.vim already exist ("$HOME/.config/nvim/init.vim"); remove or rename init.vim and try again\033[0m"
