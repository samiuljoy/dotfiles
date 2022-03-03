set encoding=utf-8
set nocompatible
filetype plugin indent on
if &term == "linux"
	set bg=light
	color pablo
	let loaded_matchparen = 1
else
	set bg=dark
	set termguicolors
	let &t_8f = "\<ESC>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<ESC>[48;2;%lu;%lu;%lum"
	color miramare-night
endif
" Syntax disabled
"syntax on
set cursorline
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set ls=0
set path+=**
set ttyfast
set numberwidth=1
"set relativenumber number
"set listchars=tab:\ ->
"set listchars=tab:●-
"set list
set noruler
set splitbelow splitright
set mouse=a
set nobackup
set wildmenu
set wildmode=longest,list,full
set noswapfile
set incsearch
set autoindent
set autoread
"set smartcase
" file exit,save and quit
map <S-q> :q<CR>
map <S-w> :w<CR>
map <S-z> :q!<CR>
" tab navigation
nnoremap <silent> <Del> :tabnext<CR>
nnoremap <silent> <Ins> :tabprevious<CR>
" Close all tabs
nnoremap <silent> <S-a> :tabonly<CR> :q<CR>
" split window navigation
nnoremap <silent> <space> <C-w>w
nnoremap <silent> h <C-w><Left>
nnoremap <silent> l <C-w><Right>
nnoremap <silent> j <C-w><Down>
nnoremap <silent> k <C-w><Up>
" spell-check toggle with <F5>
map <F5> :setlocal spell! spelllang=en_us<CR>
" NerdTree toggle with C-n
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" scroll half page with space
"nnoremap <space> mp `p<c-d>
" Toggle cursor-line with <F2>
let s:no_cursor = 1
function! ToggleCursorline()
	if s:no_cursor == 1
		let s:no_cursor = 0
		set cursorline
	else
		let s:no_cursor = 1
		set nocursorline
	endif
endfunction
nnoremap <F2> :call ToggleCursorline()<CR>
" Toggle syntax highlighting with <F3>
let s:syntax_val = 1
function! ToggleSyntax()
	if s:syntax_val == 1
		let s:syntax_val = 0
		syntax off
	else
		let s:syntax_val = 1
		syntax enable
	endif
endfunction
nnoremap <F3> :call ToggleSyntax()<CR>
" Toggle expandtab with <F4>
let s:expand_tab = 0
function! ToggleExpandTab()
	if s:expand_tab == 0
		let s:expand_tab = 1
		set expandtab
		echo 'not using tabs from now on'
	else
		let s:expand_tab = 0
		set noexpandtab
		echo 'using tabs from now on'
	endif
endfunction
nnoremap <F4> :call ToggleExpandTab()<CR>
" Replace tabs with spaces
let s:replace_tab = 1
function! ReplaceTab()
	if s:replace_tab == 0
		let s:replace_tab = 1
		:silent! %s/\t/	/g
		set expandtab
		echo "replaced tabs with spaces and disabled set list"
	else
		let s:replace_tab = 0
		:silent! %s/    /\t/g
		set noexpandtab
		set list
		echo "replaced spaces with tabs and enabled set list"
	endif
endfunction
nnoremap <F6> :call ReplaceTab()<CR>
" Toggle resize option
let s:resize_val = 0
function! ToggleResize()
	if s:resize_val == 0
		let s:resize_val = 1
		:resize
	else
		let s:resize_val = 0
		:resize 25
	endif
endfunction
nnoremap <F9> :call ToggleResize()<CR>
" Toggle numberline
let s:number = 0
function! ToggleNumber()
	if s:number == 0
		let s:number = 1
		set number
		set relativenumber
	else
		let s:number = 0
		set nonumber
		set norelativenumber
	endif
endfunction
nnoremap <F10> :call ToggleNumber()<CR>
autocmd FileType make setlocal noexpandtab
autocmd FileType vim unmap <F6>
" unwanted section at the moment
"autocmd FileType c set list
"autocmd FileType vim unmap <F12>
"autocmd BufEnter *.info call CenterDoc()
"autocmd BufEnter *.info unmap <S-w>
" :let g:NERDTreeWinSize=30
" let NERDTreeShowHidden=1
" execute pathogen#infect()
" autocmd BufEnter *.md setlocal spell spelllang=en_us
" File browsing
"let g:netrw_banner=0
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_liststyle=3
