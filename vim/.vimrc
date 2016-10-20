set nocompatible
filetype off

"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'klen/python-mode'
Plug 'tpope/vim-fugitive'
Plug 'sjl/gundo.vim'
Plug 'othree/html5.vim'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'honza/vim-snippets'
Plug 'ctrlpvim/ctrlp.vim'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'mtglsk/wikipedia.vim'
Plug 'bcicen/vim-vice'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'cseelus/vim-colors-lucid'
Plug 'vim-scripts/Solarized'
Plug 'https://github.com/gko/vim-coloresque'
Plug 'muellan/am-colors'
Plug 'dracula/vim'
call plug#end()

" ================ General Config ====================
let mapleader = ","
set cursorline
set title                 " Sets the title at top of tab to be the filename if "titlestring" isn't defined
set number                " Line numbers on the left hand side
set visualbell            " That bell is the worst sound. Shut it the fuck off.
syntax enable             " Sets syntax highlighting on because what is this notepad
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=5112          " Default is 20, I'd rather set this to infinity
set nofoldenable          " Don't fold shit because it's the worst.
set backspace=2
noremap <silent> <Leader>- :split<CR>
noremap <silent> <Leader><bar> :vsplit<CR>
" testing the user of semi colon as colon
nmap ; :

" Escape also mapped to jj
imap jj <Esc> :w<CR>
set clipboard=unnamed

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Turn off Ex mode
nnoremap Q <nop>

map <Esc><Esc> :w<CR>

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
set term=screen-256color
set termencoding=utf-l8

if !has("gui_running")
	let g:solarized_termtrans=1
	let g:solarized_termcolors=256
endif

colorscheme Solarized
set background=dark

" Go to colorscheme by number
noremap <leader>1 :colorscheme Monokai<cr>
noremap <leader>2 :colorscheme Solarized<cr>
noremap <leader>3 :colorscheme Dracula<cr>
noremap <leader>4 :colorscheme lucid<cr>
noremap <leader>5 :colorscheme amcolors<cr> :set background=dark<cr>
noremap <leader>6 :colorscheme vice<cr>

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1


" ================ Turn Off Swap Files ==============
set noswapfile
set hidden
set undofile
set undodir=~/.vim/undodir


" ================ Indentation ======================
let g:polyglot_disabled = ['javascript', 'jsx']
let g:jsx_ext_required = 0
filetype plugin indent on
autocmd FileType html setlocal shiftwidth=2 tabstop=2
au Filetype python setl et ts=4 sw=4
au Filetype javascript setl et ts=2 sw=2
au Filetype css setl et ts=4 sw=4
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
set wildignore=node_modules/*,jspm_packages/*,*.jpg,*.png,*.gif,*.woff,.DS_Store
autocmd FileType css set omnifunc=csscomplete#CompleteCSS           " Gives css auto completion to files using filetype=css
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" here for UltiSnips and YCM
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-Tab>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-h>"

" DelimitMate
let delimitMate_expand_cr = 2
" let b:delimitMate_expand_cr = 1
" let delimitMate_expand_cr = 1
" let b:delimitMate_jump_expansion = 1


" ================ Search ===========================
set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>


" ================ Navigation  ===========================
" "Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>

" Open VIMRC
nnoremap <leader>v :e $MYVIMRC<CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = "find %s -type f | grep -Ev '"+ g:ctrlp_custom_ignore +"'"
let g:ctrlp_use_caching = 1
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>t'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
map <leader>r :CtrlPClearCache<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Navigating between open buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" ================ Fugitive  ===========================
nmap <leader>g :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gd :Gdiff<cr>
nmap <leader>gp :Gpush<cr>


" ================ Syntastic  ===========================
" show any linting errors immediately
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_w = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_loc_list_height = 4
