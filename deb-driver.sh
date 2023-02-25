function CHECK_PACKAGE() {
	if ! command -v $1 &> /dev/null && ! dpkg -s $1 &> /dev/null 
	then
		CHECK_PACKAGE_D $1 $2
	fi
}

function CHECK_PACKAGE_D() {
	clear && echo -e "\n\033[1;32m[*] Installing $1\033[m" \
	&& sudo apt-get update && eval $2 \
	&& echo -e "\n\033[0;37;42m$1 installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp "" \
	|| echo -e "\n\033[0;37;41m$1 could not be installed | PRESS ENTER TO CONTINUE\033[0m" && read -sp ""
}

function NODE_DRIVER() {
	CHECK_PACKAGE curl "sudo apt-get install curl"
	CHECK_PACKAGE_D node "curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - && sudo apt-get install -y nodejs"
}

#--------------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------------------------------------------------------

CHECK_PACKAGE nvim "sudo apt-get install neovim"

CHECK_PACKAGE node "NODE_DRIVER"

CHECK_PACKAGE yarn "sudo apt-get install yarn"

CHECK_PACKAGE python3 "sudo apt-get install python3 python3-pip"

CHECK_PACKAGE unzip "sudo apt-get install unzip"

CHECK_PACKAGE curl "sudo apt-get install curl"

CHECK_PACKAGE git "sudo apt-get install git"

TEMP=$(mktemp)
CHECK_PACKAGE_D nerd-fonts "wget -O $TEMP https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/3270.zip \
&& unzip $TEMP -d $HOME/.fonts; rm $TEMP"

CHECK_PACKAGE_D vim-plug "sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'"

CHECK_PACKAGE_D nvim-ide "git clone https://github.com/GabrielFlores8227/nvim $HOME/.config/nvim"
