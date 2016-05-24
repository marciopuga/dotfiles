set nocompatible
set shell=bash

filetype off

" =============== Vundle Initialization ===============
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'
Plugin 'klen/python-mode'
Bundle 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'sjl/gundo.vim'
Plugin 'othree/html5.vim'
Plugin 'isRuslan/vim-es6'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'sheerun/vim-polyglot'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'Raimondi/delimitMate'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'scrooloose/nerdtree'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Solarized'

call vundle#end()


" ================ General Config ====================
let mapleader = ","
set cursorline
set title                 " Sets the title at top of tab to be the filename if "titlestring" isn't defined
set number                " Line numbers on the left hand side
set visualbell            " That bell is the worst sound. Shut it the fuck off.
syntax enable             " Sets syntax highlighting on because what is this notepad

set mouse=a

set clipboard=unnamed     " Shared clipboard with MacOS
set encoding=utf-8        " Duh
set history=5112          " Default is 20, I'd rather set this to infinity
set nofoldenable          " Don't fold shit because it's the worst.

" testing the user of semi colon as colon
nmap ; :

" Escape also mapped to jj
imap jj <Esc>

" Turn off Ex mode
nnoremap Q <nop>

" Mappings to move lines
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap ∆ :m .+1<CR>== " Alt + j
nnoremap ˚ :m .-2<CR>== "Alt + k
vnoremap ˚ :m '<-2<CR>gv=gv
vnoremap ∆ :m '>+1<CR>gv=gv

" Enter newlines without entering insert mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <CR> o<Esc>k

" Absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

" ================ Theme  ======================
set guifont=Inconsolata\ for\ Powerline:h15
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-l8

if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
endif

colorscheme solarized
set background=dark


" ================ Turn Off Swap Files ==============
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir


" ================ Indentation ======================
filetype plugin indent on " This gets vim to automatically load filetype specific options for plugins and indentation
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
au Filetype python setl et ts=4 sw=4
au Filetype javascript setl et ts=2 sw=2
autocmd BufWritePre * :%s/\s\+$//e " Remove trailing whitespace on save

" Fix indenting for css style things (sass, css)
au BufEnter *.css set nocindent
au BufLeave *.css set cindent
au BufEnter *.scss set nocindent
au BufLeave *.scss set cindent
au BufEnter *.sass set nocindent
au BufLeave *.sass set cindent
au BufEnter *.less set nocindent
au BufLeave *.less set cindent

autocmd BufNewFile,BufRead *.scss set ft=scss.css "Sets filetype of scss to be css. Helps with plugins.
autocmd BufNewFile,BufRead *.less set ft=less.css "Sets filetype of less to be css. Helps with plugins.


" ================ Completion =======================
set wildignore=node_modules/*,jspm_packages/*,*.jpg,*.png,*.gif,*.woff
autocmd FileType css set omnifunc=csscomplete#CompleteCSS           " Gives css auto completion to files using filetype=css
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" here for UltiSnips and YCM
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-Tab>', '<Up>']
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" DelimitMate
let b:delimitMate_expand_cr = 1
let delimitMate_expand_cr = 1
let b:delimitMate_jump_expansion = 1


" ================ Scrolling ========================
set scrolloff=999         " Keeps the cursor vertically centered.


" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" ================ Navigation  ===========================
" "Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Local list nav
nnoremap fj :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **" <Bar> cnext<CR>


" ================ Plugin - Gundo  ===========================
" Custom Plugin Mappings
nnoremap -- :GundoToggle<CR>

nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>gx :Gbrowse<CR>
nnoremap <leader>g :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>c :ccl<CR>
nnoremap <leader>o :copen<CR>
map <Esc><Esc> :w<CR>


" ================ Plugin - Syntastic  ===========================
" show any linting errors immediately
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 5

