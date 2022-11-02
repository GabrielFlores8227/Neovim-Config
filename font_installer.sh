echo "[-] Downloading font 3270 | https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip" && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip || exit
unzip ./3270.zip -d ~/.fonts && fc-cache -fv && echo "[+] Font 3270 installed!" || exit

