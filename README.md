## 💻 Interface

Unlock the full potential of your Neovim editor and elevate it to an IDE workspace with these essential customizations and plugins.

![GIF](https://github.com/GabrielFlores8227/Neovim/blob/main/assets/gif.gif)

## ⚠️ Required Packages
- Node.js
- Npm
- Yarn
- Python3 & Python3-pip
- NerdFonts

## 📙 Support for
- Python
- Bash
- Node.js
- TypeScript
- JavaScript
- HTML
- CSS
- Others


## ⚡ Quick Installation (Beta)
Streamline the process of configuring Neovim and its plugins on Unix systems with the help of `unix-driver.sh`. The script will install Neovim, plugins, and required packages.

```bash
git clone https://github.com/GabrielFlores8227/nvim && chmod +x ./nvim/unix-driver.sh && ./nvim/unix-driver.sh
```

## 🐢 Manual Installation

To install the Neovim configuration manually, follow these steps:

1. Create a Neovim configuration directory if it doesn't exist:
   - On Linux: `mkdir -p ~/.config/nvim`
   - On macOS: `mkdir -p ~/.config/nvim`
   - On Windows: `mkdir -p %USERPROFILE%\AppData\Local\nvim`

2. Copy [init.vim](https://github.com/GabrielFlores8227/Neovim-Setup/blob/main/init.vim) within the Neovim configuration directory:
   - On Linux and macOS: `touch ~/.config/nvim/init.vim`
   - On Windows: `type nul > %USERPROFILE%\AppData\Local\nvim\init.vim`

3. Install [Vim-Plug](https://github.com/junegunn/vim-plug)

4. Open Neovim and execute `:PlugInstall`

 ## ⌨️ keyboard Shortcuts
 
  - CTRL-n: Toggle NERDTree
  - <TAB>: Trigger completion with characters ahead and navigate.
  - <S-TAB>: Navigate backward in completion popup.
  - <CR>: Accept selected completion item or format.
  - <c-space>: Trigger completion.
  - [g: Navigate to the previous diagnostic.
  - ]g: Navigate to the next diagnostic.
  - gd: Go to the definition of the symbol under the cursor.
  - gy: Go to the type definition of the symbol under the cursor.
  - gi: Go to the implementation of the symbol under the cursor.
  - gr: Go to the references of the symbol under the cursor.
 
 ### License

This script is licensed under the [MIT License](LICENSE).

Feel free to use, modify, and distribute this script as per the terms of the license.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
