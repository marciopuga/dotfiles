set nocompatible
filetype off
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
call plug#begin('~/.vim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'vim-scripts/BufOnly.vim'
Plug 'Raimondi/delimitMate'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'evanleck/vim-svelte'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Themes
Plug 'flazz/vim-colorschemes'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mtglsk/wikipedia.vim'
Plug 'bcicen/vim-vice'
Plug 'cseelus/vim-colors-lucid'
Plug 'vim-scripts/Solarized'
Plug 'dracula/vim'
Plug 'gkjgh/cobalt'
call plug#end()

" ================ General Config ====================
nnoremap <SPACE> <Nop>
let mapleader = " "
map <leader>= mzgg=G`z
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Jump to recently pasted
nnoremap gp `[v`]

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
" set visualbell            " That bell is the worst sound. Shut it the fuck off.
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



set clipboard^=unnamed,unnamedplus

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
set termencoding=utf-8

let g:solarized_termtrans=1
let g:solarized_termcolors=256
set guifont=Roboto\ Mono\ for\ Powerline\ 14

colorscheme molokai
" set background=dark

" Go to colorscheme by number
noremap <leader>1 :colorscheme molokai<cr>
noremap <leader>2 :colorscheme palenight<cr> :set background=dark<cr>
noremap <leader>3 :colorscheme Dracula<cr>
noremap <leader>4 :colorscheme lucid<cr>
noremap <leader>5 :colorscheme vice<cr>
noremap <leader>6 :colorscheme wikipedia<cr>
noremap <leader>7 :colorscheme Solarized<cr> :set background=dark<cr>
noremap <leader>8 :colorscheme random<cr>
noremap <leader>9 :colorscheme minimalist<cr>

" ================ Turn Off Swap Files ==============
set noswapfile
set backupcopy=yes
set nowritebackup
set undofile
set undodir=~/.vim/undodir

" ================ Indentation ======================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
filetype plugin indent on
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

" nnoremap <Leader>s :w<CR>

" ================ Navigation  ===========================
" nnoremap <leader>s :NERDTreeFind<CR>
nmap <C-n> :CocCommand explorer<CR>
" Show hidden files by default
let NERDTreeShowHidden=1

" Open VIMRC
nnoremap <leader>v :e $MYVIMRC<CR>

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

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" FZF & Rg
let g:fzf_preview_window = 'right:40%'

set wildmenu
set wildmode=list:longest,list:full
set wildignore=node_modules/*,jspm_packages/*,.DS_Store
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
noremap <leader>r :Rg<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>f :GFiles<CR>
noremap <leader>F :Files<CR>

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --hidden --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)
