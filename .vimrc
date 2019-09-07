" Author: Jakub Jerzy Guzek

let mapleader=';'

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'mboughaba/i3config.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

set background=dark

" Basics
	set nocompatible
	set nohlsearch
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set clipboard+=unnamedplus
" Colors
	augroup i3config_ft_detection
		autocmd!
		autocmd BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
	augroup END
	let g:solarized_termcolors=256
	colorscheme gruvbox
	function ColorTweak()
		let g:gruvbox_termcolors=256
		let g:solarized_termcolors=256
		let g:gruvbox_contrast_light='hard'
		let g:gruvbox_contrast_dark='hard'
		highlight Normal ctermbg=NONE
		highlight LineNr ctermbg=NONE
		highlight CursorLineNr ctermbg=NONE
		highlight Folded ctermbg=NONE
		highlight ErrorMsg ctermbg=NONE
	endfunction
	call ColorTweak()
" Airline
	let g:airline_theme='solarized'
" Autocompletion
	set wildmode=longest,list,full
" Disable auto-commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Enable Goyo
	map <leader>f :Goyo \| call ColorTweak() \| set linebreak<CR>
" Enable spell-check
	map <leader>oo :setlocal spell! spelllang=en_gb<CR>
	map <leader>op :setlocal spell! spelllang=pl<CR>
" Open splits at bottom and right
	set splitbelow splitright
" Shortcuts for split navigation
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Shortcut for replace-all
	nnoremap S :%s//g<left><left>
" Copile snippets
	" map <leader>3p :w! \| :terminal ++rows=7 python %<CR>
	" map <leader>2p :w! \| :terminal ++rows=7 python2 %<CR>
	map <leader>c :w! \| !compiler %<CR>
	map <leader>p :!setsid $READER %:r.pdf >/dev/null 2>&1 &<CR><CR>
" Ensure proper file reading
	augroup FileRead
		autocmd!
		autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
		autocmd BufRead,BufNewFile *.tex set filetype=tex
		autocmd BufRead,BufNewFile *.py set filetype=python
	augroup END
" Copy to system clipboard
	vnoremap <C-c> "+y
	map <C-p> "+p
" Delete trailing whitespaces on write
	augroup DelSpace
		autocmd BufWritePre * %s/\s\+$//e
	augroup END
" Snippets for config/bib files
	map <leader>v :vsp ~/.config/nvim/init.vim<CR>
	map <leader>b :vsp ~/Documents/latex/bib.bib<CR>
" Navigation
	inoremap <leader><leader> <Esc>/<++><Return>"_c4l
	vnoremap <leader><leader> <Esc>/<++><Return>"_c4l
	map <leader><leader> <Esc>/<++><Return>"_c4l
