set nocompatible
filetype off
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/BufOnly.vim'
Plug 'othree/html5.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe'
Plug 'ternjs/tern_for_vim'
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'stephpy/vim-yaml'
Plug 'elzr/vim-json'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'cristianoliveira/vim-react-html-snippets'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'mtglsk/wikipedia.vim'
Plug 'bcicen/vim-vice'
Plug 'cseelus/vim-colors-lucid'
Plug 'vim-scripts/Solarized'
Plug 'dracula/vim'
Plug 'TroyFletcher/vim-colors-synthwave'
Plug 'gkjgh/cobalt'
call plug#end()

" ================ General Config ====================
nnoremap <SPACE> <Nop>
let mapleader = " "
map <leader>= mzgg=G`z

" Always show cursor
set ruler

" Autoload files that have changed outside of vim
set autoread

set lazyredraw
set ttyfast
set cursorline
set title                 " Sets the title at top of tab to be the filename iftitlestring" isn't defined
set showtabline=2
set number                " Line numbers on the left hand side
set visualbell            " That bell is the worst sound. Shut it the fuck off.
" syntax enable             " Sets syntax highlighting on because what is this? notepad?
set mouse=a
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set history=5112          " Default is 20, I'd rather set this to infinity
set nofoldenable          " Don't fold shit because it's the worst.
let g:markdown_folding = 0
let g:markdown_enable_folding = 0
let g:markdown_syntax_conceal = 0
let g:vim_json_syntax_conceal = 0
set backspace=2
set expandtab
set tabstop=2
noremap <silent> <Leader>- :split<CR>
noremap <silent> <Leader>\ :vsplit<CR>

" Escape also mapped to jj
imap jj <Esc> :w<CR>
map <Esc><Esc> :w<CR>

set clipboard=unnamed

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

" Copy entire buffer to
noremap <silent> <Leader>y :%y<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

" Turn off Ex mode
nnoremap Q <nop>

" Mappings to move lines
" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap ∆ :m .+1<CR>== " Alt + j
nnoremap ˚ :m .-2<CR>== "Alt + k

" Enter newlines without entering insert mode
" http://vim.wikia.com/wiki/Insert_newline_without_entering_insert_mode
nnoremap <CR> o<Esc>k

" Absolute line numbers in insert mode, relative otherwise for easy movement
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber


" ================ Theme  ======================
set t_Co=256
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
set term=screen-256color
set termencoding=utf-8

let g:solarized_termtrans=1
let g:solarized_termcolors=256
set guifont=Roboto\ Mono\ for\ Powerline\ 14

colorscheme Monokai
" set background=dark

" Go to colorscheme by number
noremap <leader>1 :colorscheme Monokai<cr>
noremap <leader>2 :colorscheme Solarized<cr> :set background=dark<cr>
noremap <leader>3 :colorscheme Dracula<cr>
noremap <leader>4 :colorscheme lucid<cr>
noremap <leader>5 :colorscheme vice<cr>
noremap <leader>6 :colorscheme wikipedia<cr>
noremap <leader>7 :colorscheme synthwave<cr>
noremap <leader>8 :colorscheme random<cr>

" ================ Turn Off Swap Files ==============
set noswapfile
set backupcopy=yes
set nowritebackup
set hidden
set undofile
set undodir=~/.vim/undodir

" ================ Indentation ======================
filetype plugin indent on
" let g:indentLine_setConceal = 0
let g:polyglot_disabled = ['javascript', 'jsx']
autocmd FileType * setlocal sw=2 ts=2 et
autocmd FileType markdown set conceallevel=0
" autocmd FileType html setlocal sw=2 ts=2 et
au Filetype python setl et ts=4 sw=4
au Filetype javascript setl et ts=2 sw=2
au Filetype json setl et ts=2 sw=2
au Filetype css setl et ts=2 sw=2
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

" here for UltiSnips and YCM
let g:ycm_filepath_blacklist = {}
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:ycm_key_list_previous_completion = ['<s-Tab>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsListSnippets="<c-h>"

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

nnoremap <Leader>s :w<CR>

" ================ Navigation  ===========================
" Toggle NERDtree
map <C-n> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" Show hidden files by default
let NERDTreeShowHidden=1

" Open VIMRC
nnoremap <leader>v :e $MYVIMRC<CR>

"" ctrlp.vim
set wildmenu
set wildmode=list:longest,list:full
set wildignore=node_modules/*,jspm_packages/*,.DS_Store
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 1
let g:ctrlp_show_hidden=1
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<C-f>'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
map <leader>r :CtrlPClearCache<cr>
" CtrlP -> override <C-o> to provide options for how to open files
let g:ctrlp_arg_map = 1

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Navigating between open buffers
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close current buffer
nnoremap <Leader>x :bd<CR>

" Close all buffers but current
nnoremap <Leader>X :BufOnly<CR>

" ================ Fugitive  ===========================
nmap <leader>gs :Gstatus<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>ga :Gwrite<cr>
nmap <leader>gl :Glog<cr>
nmap <leader>gb :!git open<cr>
nmap <leader>gp :Gpush<cr>
set diffopt+=vertical " open vimdiff with vertical windows

let g:ale_linters = {'javascript': ['standard']}
let g:ale_linter_aliases = {'jsx': 'css'}
" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['standard'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Enable completion where available.
let g:ale_completion_enabled = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_enabled = 1
nmap <leader>c :ALEToggle<cr>

" Multiple cursors
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<C-m>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_next_key            = '<C-m>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"EMMET CONFIG
let g:user_emmet_leader_key=','
set conceallevel=0
