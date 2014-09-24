filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on


" ============================================================================
" Settings
" ============================================================================
set bs=indent,eol,start
set mouse=a
set cursorline
set nowrap
set number


" ============================================================================
" Enable highlight, incremental and smart case searching.
" ============================================================================
set hlsearch
set incsearch
set ignorecase
set smartcase


" ============================================================================
" Disable backup and swap files.
" ============================================================================
set nobackup
set nowritebackup
set noswapfile


" ============================================================================
" Indentation setup.
" ============================================================================
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set autoindent


" ============================================================================
" Keymapping
" ============================================================================
let mapleader = ","
set pastetoggle=<F4>

" Easier moving between tabs.
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Easier moving of code blocks.
vnoremap < <gv
vnoremap > >gv

" Easier moving around the windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Quick write (F2) and load (F3) session.
map <F2> :mksession! ~/.vim_session<CR>
map <F3> :source ~/.vim_session<CR>


" ============================================================================
" Enable highlighting of trailing spaces.
" ----------------------------------------------------------------------------
" MUST be inserted BEFORE the colorscheme command.
" See: http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" ============================================================================
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" ============================================================================
" Set right margin line.
" ----------------------------------------------------------------------------
" MUST be inserted BEFORE the colorscheme command.
" ============================================================================
"set colorcolumn=100
"autocmd ColorScheme * highlight ColorColumn ctermbg=235
if exists('+colorcolumn')
      set colorcolumn=110
  else
        au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
    endif

" ============================================================================
" Color scheme.
" ============================================================================
set t_Co=256
colorscheme wombat256mod


" ============================================================================
" Powerline -- https://github.com/Lokaltog/powerline
" ============================================================================
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2


" ============================================================================
" CtrlP -- https://github.com/kien/ctrlp.vim
" ============================================================================
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*build/*
set wildignore+=*dist/*
set wildignore+=*.egg-info/*
set wildignore+=*/coverage/*


" ============================================================================
" Ack -- https://github.com/mileszs/ack.vim
" ============================================================================
nmap <leader>a <Esc>:Ack!


" ============================================================================
" NERDTree -- https://github.com/scrooloose/nerdtree.git
" ============================================================================
nmap <leader>t :NERDTree<CR>

" Display hidden files.
let NERDTreeShowHidden=1
" Fast copy to clipboard
map <F3> :%y+ <CR>
" Show NERDTree
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" Bind key to fast Autoformat
noremap <F4> :Autoformat<CR><CR>
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
let g:airline#extensions#tabline#enabled = 1
" Run a spellchecker
map <F5> :setlocal spell spelllang=pl <CR>
