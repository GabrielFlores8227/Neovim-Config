# ⭐ Neovim Config

![GIF](https://github.com/GabrielFlores8227/GabrielFlores8227/blob/main/global-assets/Neovim-Config/image.gif)

This repository contains Neovim configuration files. Neovim is a powerful text editor built as a modernized version of Vim. With this configuration, I have customized Neovim to enhance my coding and text editing workflow. 

## ⚠️ Main Required Packages
- Node.js
- Npm
- Yarn
- Python3 & Python3-pip
- NerdFonts

## 📙 Support
- Python
- Bash
- Node.js
- TypeScript
- JavaScript
- HTML
- CSS
- Others

## 🔌 Plug-Manager
 - [vim-plug](https://github.com/junegunn/vim-plug)

## ⚡ Quick Installation (Beta)
Streamline the process of configuring Neovim and its plugins on Unix systems with the help of `unix-driver.sh`. The script will install Neovim, plugins, and required packages.

```bash
git clone https://github.com/GabrielFlores8227/Neovim-Config && chmod +x ./Neovim-Config/unix-driver.sh && ./Neovim-Config/unix-driver.sh
```

## 📎 Keybindings

- Enable line numbers: `set number`
- Enable auto-indentation: `set autoindent`
- Disable line wrapping: `set nowrap`
- Enable file type detection: `filetype on`
- Enable syntax highlighting: `syntax on` and `syntax enable`
- Set encoding to UTF-8: `set encoding=UTF-8`
- Disable backup files: `set nobackup` and `set nowritebackup`
- Set the updatetime for CursorHold events: `set updatetime=300`
- Show sign column for diagnostics and signs: `set signcolumn=yes`
- Enable system clipboard integration: `set clipboard+=unnamedplus`
- NERDTree configuration:
  - Show hidden files: `let NERDTreeShowHidden=1`
  - Toggle NERDTree: `nmap <C-n> :NERDTreeToggle<CR>`
- Plugin management:
  - Initialize the plugin manager: `call plug#begin()`
  - Configure plugins (e.g., Prettier, NerdTree, Vim devicons): `Plug 'plugin-name'`
  - End plugin manager initialization: `call plug#end()`
- Prettier configuration: Configure Prettier options (e.g., single_quote, trailing_comma) using `let g:prettier#config#option = value`
- Format on save with Prettier: `autocmd BufWritePre *.* :Prettier | w`
- Vim-devicons configuration:
  - Set font for file icons: `set guifont=DroidSansMono\ Nerd\ Font\ 11`
- Colorscheme: `colorscheme dracula` (replace "dracula" with your desired colorscheme)
- coc.nvim configuration:
  - Set global extensions: `let g:coc_global_extensions = ['coc-extension1', 'coc-extension2']`
- Key mappings for coc.nvim: Define key mappings using `nmap`, `xmap`, `imap`, etc.
- Miscellaneous keybindings: Add your remaining configurations and mappings here

## 💻 Copy [init.vim](https://github.com/GabrielFlores8227/Neovim-Setup/blob/main/init.vim)

```vim
" Enable line numbers
set number

" Enable auto-indentation
set autoindent

" Disable line wrapping
set nowrap

" Enable file type detection
filetype on

" Set encoding to UTF-8
set encoding=UTF-8

" Disable backup files
set nobackup
set nowritebackup

" Set the updatetime for CursorHold events
set updatetime=300

" Show sign column for diagnostics and signs
set signcolumn=yes

" Enable system clipboard integration
set clipboard+=unnamedplus

" NERDTree configuration
let NERDTreeShowHidden=1

" Enable syntax highlighting
syntax on
syntax enable

" Initialize the plugin manager
call plug#begin()

" Prettier plugin for code formatting
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" NerdTree plugin for directory tree view
Plug 'preservim/nerdtree'

" Vim devicons for file icons
Plug 'ryanoasis/vim-devicons'

" UltiSnips for snippets support
Plug 'SirVer/ultisnips'

" Additional snippets for various languages
Plug 'honza/vim-snippets'

" Auto pairs for automatic closing of brackets, quotes, etc.
Plug 'jiangmiao/auto-pairs'

" Syntax highlighting for multiple languages
Plug 'sheerun/vim-polyglot'

" Lightline.vim for a customizable statusline/tabline
Plug 'itchyny/lightline.vim'

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'crusoexia/vim-monokai'

" coc.nvim for autocompletion and language server integration
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" End plugin manager initialization
call plug#end()

" Prettier configuration
let g:prettier#config#single_quote = v:true
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#tab_width = 2
let g:prettier#config#jsx_bracket_same_line = v:true

" Enable format on save with Prettier
autocmd BufWritePre *.* :Prettier | w

" Prettier autocmd group for format on save
augroup Prettier
  autocmd!
  autocmd BufWritePre *.* :Prettier
augroup END

" Configure vim-devicons
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Statusline setup
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'fileencoding', 'fileformat', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head'
  \ },
  \ 'component_expand': {
  \   'filetype': 'lightline#filetype#default',
  \   'lineinfo': 'lightline#lineinfo#percentage',
  \   'percent': 'lightline#percent#data',
  \   'gitbranch': 'lightline#gitbranch#branchname'
  \ },
  \ 'component_type': {
  \   'gitbranch': 'readonly'
  \ }
\ }

let g:lightline.colorscheme = 'one'
let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileencoding', 'fileformat', 'filetype' ] ]
\ }

let g:lightline.component_function = {
  \ 'gitbranch': 'fugitive#head'
\ }

let g:lightline.component_expand = {
  \ 'filetype': 'lightline#filetype#default',
  \ 'lineinfo': 'lightline#lineinfo#percentage',
  \ 'percent': 'lightline#percent#data',
  \ 'gitbranch': 'lightline#gitbranch#branchname'
\ }

let g:lightline.component_type = {
  \ 'gitbranch': 'readonly'
\ }

let g:lightline.separator = {
  \ 'left': '',
  \ 'right': ''
\ }

let g:lightline.subseparator = {
  \ 'left': '',
  \ 'right': ''
\ }

let g:lightline.tabline = {
  \ 'left': [ [ 'buffers' ],
  \           [ 'tabnum' ] ],
  \ 'right': [ [ 'close' ] ]
\ }
let g:lightline.component_type = {
  \ 'gitbranch': 'readonly'
\ }
let g:lightline.active = {
  \ 'left': [ [ 'mode', 'paste' ],
  \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \ 'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'fileencoding', 'fileformat', 'filetype' ] ]
\ }
let g:lightline.component_expand = {
  \ 'filetype': 'lightline#filetype#default',
  \ 'lineinfo': 'lightline#lineinfo#percentage',
  \ 'percent': 'lightline#percent#data',
  \ 'gitbranch': 'lightline#gitbranch#branchname'
\ }

let g:lightline.colorscheme = 'one'
let g:lightline.separator = {
  \ 'left': '',
  \ 'right': ''
\ }
let g:lightline.subseparator = {
  \ 'left': '',
  \ 'right': ''
\ }
let g:lightline.tabline = {
  \ 'left': [ [ 'buffers' ],
  \           [ 'tabnum' ] ],
  \ 'right': [ [ 'close' ] ]
\ }

" Colorscheme monokai
" colorscheme monokai

" Colorscheme dracula
colorscheme dracula
let g:lightline.colorscheme = 'dracula'

" NERDTree key mapping
nmap <C-n> :NERDTreeToggle<CR>

" Customize NERDTree directory arrows
let g:NERDTreeDirArrowExpandable="📁"
let g:NERDTreeDirArrowCollapsible="📂"

" Configure coc.nvim
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-python',
  \ 'coc-sh',
  \ 'coc-prettier',
  \ 'coc-docker',
  \ 'coc-yaml',
  \ 'coc-xml',
  \ ]


" Key mappings for coc.nvim
inoremap <silent><expr> <TAB>
    \ coc#pum#visible() ? coc#pum#next(1) :
    \ CheckBackspace() ? "\<Tab>" :
    \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add your remaining configurations and mappings here
```

## 📖 License

This script is licensed under the [MIT License](https://en.wikipedia.org/wiki/MIT_License).

Feel free to use, modify, and distribute this script as per the terms of the license.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
