#!/bin/bash

################################################################################
# This script is licensed under the MIT License.                               #
#                                                                              #
# MIT License                                                                  #
#                                                                              #
# Permission is hereby granted, free of charge, to any person obtaining a      #
# copy of this software and associated documentation files (the "Software"),   #
# to deal in the Software without restriction, including without limitation    #
# the rights to use, copy, modify, merge, publish, distribute, sublicense,     #
# and/or sell copies of the Software, and to permit persons to whom the        #
# Software is furnished to do so, subject to the following conditions:         #
#                                                                              #
# The above copyright notice and this permission notice shall be included      #
# in all copies or substantial portions of the Software.                       #
#                                                                              #
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS      #
# OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,  #
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL      #
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER   #
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING      #
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER          #
# DEALINGS IN THE SOFTWARE.                                                    #
################################################################################

##
# Function
##

function convert_url() {
    local url=$1
    local raw_url=${url/blob\/main/raw\/main}
    echo "$raw_url"
}

function get_package_name() {
  local url=$1
  local filename=$(basename "$url")
  echo "$filename"
}

function download() {
  local converted_url=$(convert_url $1)
  local package_name=$(get_package_name $converted_url)
  local destination="/tmp/$(date +'%Y%m%d%H%M%S%N' | cut -b1-17).sh"

  echo -e "\n\n\033[0;37;43m[*] Downloading $package_name | $destination\033[m\n"

  wget -O $destination $converted_url \
  && chmod +x $destination 

  $destination
}

##
# Execute
##

if command -v apt >/dev/null; then
    sudo apt update -y
elif command -v yum >/dev/null; then
    sudo yum update -y
elif command -v dnf >/dev/null; then
    sudo dnf update -y
else
    exit 1
fi

# python
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-python/latest-python.sh"

# curl
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-curl/latest-curl.sh"

# nodejs
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-nodejs/latest-nodejs.sh"

# yarn
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-yarn/latest-yarn.sh"

# neovim
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-neovim/latest-neovim.sh"

# xclip
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-xclip/latest-xclip.sh"

# unzip
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-unzip/latest-unzip.sh"

# wget
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-wget/latest-wget.sh"

# nerd-fonts (anonymouspro)
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-nerdfonts-anonymouspro/latest-nerdfonts-anonymouspro.sh"

# vim-plug
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-vimplug/latest-vimplug.sh"

# git
download "https://github.com/GabrielFlores8227/Linux-Packages/blob/main/latest-git/latest-git.sh"

# neovim plugs
git clone https://github.com/GabrielFlores8227/nvim $HOME/.config/nvim && sudo find $HOME/.config/nvim -type f ! -name "*.vim" -exec rm -r {} +
