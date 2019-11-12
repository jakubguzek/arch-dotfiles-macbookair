" Author: Jakub Jerzy Guzek

let mapleader=';'

" ### Plug-ins ###

call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'mboughaba/i3config.vim'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
call plug#end()

" ### General ###

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
	map <leader>p :!viewout %<CR><CR>
" Ensure proper file reading
	augroup FileRead
		autocmd!
		let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
		let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
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

" ### Code Snippets ###

" LaTeX
	autocmd FileType tex inoremap ,em \emph{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,it \textit{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,nl \begin{enumerate}<Return><Return>\end{enumerate}<Return><Return><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Return><Return>\end{itemize}<Return><Return><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Return>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tb \begin{tabular}<Return><++><Return>\end{tabular}<Return><Return><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,tab \begin{table}<Return>\centering<Return>\caption<Return>\begin{tabular}{<++>}<Return><++><Return>\end{tabular}<Return>\end{table}<Return><Return><++><Esc>6kA{}<Esc>i
	autocmd FileType tex inoremap ,chap \chapter{}<Return><Return><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Return><Return><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Return><Return><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Return><Return><++><Esc>2kf}i
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,bl \vspace{\baselineskip}<Return><Return>
	autocmd FileType tex inoremap ,eq \begin{equation}<Return><Return>\end{equation}<Return><Return><++><Esc>3ki
	autocmd FileType tex inoremap ,mm $$ <++><Esc>F$i
	autocmd FileType tex inoremap ,df \mathrm{d}


" HTML
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc

" .bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

" Markdown
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
