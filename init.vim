"base setting
syntax enable
syntax on
filetype indent on
let &t_ut=''
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set t_Co=256
set clipboard=unnamedplus
set ic
set autochdir
set termguicolors
set smartindent
set termencoding=utf-8
set fileformats=unix
set encoding=utf-8
set mouse=nv
set number
set tabstop=4
set shiftwidth=4
set ts=4
set expandtab
set autoindent
set showcmd
set noswapfile
set showmatch
set ruler
set wrap
set noshowmode
set showtabline=1
set smartcase
set notimeout
set ttimeoutlen=0
set lazyredraw
set visualbell
set history=800
set scrolloff=5
set hlsearch
set incsearch
"set cursorline
set list
set listchars=tab:\┆\ ,trail:-
"hi CursorLine ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set viewoptions=cursor,folds,slash,unix
set wildmenu
set wildmode=full
"set wildchar=<Tab>
set guicursor=n:block,i:ver1,v:block,r:block,c:block,ci:block,cr:block
set relativenumber
set path=.,/usr/include,/usr/local/include/
set foldmethod=marker
set foldlevelstart=99
set nobackup
set laststatus=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"let g:mapleader = "\<Space>"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
""If you're using tmux version 2.2 or later, you can remove the outermost
"$TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more
"information.)
if (empty($TMUX))
  if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 <https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 <https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162>
  "Based on Vim patch 7.4.1770 (`guicolors` option) <https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd>
  " <https://github.com/neovim/neovim/wiki/Following-HEAD#20160511>
  if (has("termguicolors"))
      set termguicolors
  endif
endif

call plug#begin('~/.config/nvim/plugged')
  "plugs
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  Plug 'honza/vim-snippets'
  "Plug 'morhetz/gruvbox'
  "Plug 'sainnhe/gruvbox-material'
  Plug 'ajmwagar/vim-deus'
  Plug 'jiangmiao/auto-pairs'
  Plug 'voldikss/vim-floaterm'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
  Plug 'junegunn/fzf.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  Plug 'preservim/tagbar'
call plug#end()

"coc.nvim
set hidden
set updatetime=300
set shortmess+=c
"Always show the signcolumn, otherwise it would shift the text each time
"diagnostics appear/become resolved.
if has("patch-8.1.1564")
"Recently vim can merge signcolumn and number column into one
    set signcolumn=number
else
    set signcolumn=no
endif
"GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"Make <tab> used for trigger completion, completion confirm, snippet expand
"and jump like VSCode.
inoremap <silent><expr> <TAB>
	\ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"auto install coc extensions
let g:coc_global_extensions = [
    \ 'coc-translator',
    \ 'coc-explorer',
    \ 'coc-snippets',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-tsserver',
    \ 'coc-json',
    "\ 'coc-vetur', replaced by coc-volar for better support of vue3, notice: coc-volar may need node > 15
    \ '@yaegassy/coc-volar',
    \ 'coc-phpls']

let g:coc_snippet_next = '<tab>'
let g:snips_author = 'Beatit'
"floaterm
let g:floaterm_keymap_toggle = '<F1>'
let g:floaterm_keymap_new    = '<F2>'
let g:floaterm_keymap_prev   = '<F3>'
let g:floaterm_keymap_next   = '<F4>'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_wintype = 'split'
"coc-explorer
nnoremap <silent> <C-b> :CocCommand explorer --sources=buffer-,file+ <CR>
"lazygit
"nnoremap  <silent> <C-g> :FloatermNew lazygit<CR>
nnoremap <silent> <C-g> :call LazygitWinOpen()<CR>
"coc-translator
"nnoremap <silent> <C-y> :CocCommand translator.popup<CR>

"markdown-preview
nnoremap <silent> <C-m> :MarkdownPreviewToggle<CR>
"FZF
"nnoremap <silent> <C-f> :FZF<CR>
nnoremap <silent> <C-f> :call fzf#vim#files($WORKSPACE)<CR>
nnoremap <silent> <C-s> :Rg<CR>
nnoremap <silent> <C-h> :BufferPrevious<CR>
nnoremap <silent> <C-l> :BufferNext<CR>
nnoremap <silent> <C-x> :BufferClose<CR>

"barbar
let bufferline = get(g:, 'bufferline', {})
"let bufferline._hide = v:true
let bufferline.icons = 'both'
let bufferline.insert_at_start = v:true
let bufferline.closeable = v:false
let bufferline.icon_separator_active = '|'
let bufferline.icon_separator_inactive = '|'

"tagbar -- install ctags first
nmap b :TagbarToggle<CR>

let g:LanguageClient_serverCommands = {
    \ 'vue': ['vls']
    \ }

"fzf settings
let g:fzf_layout = { 'down': '35%' }
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

"lightline
let g:lightline = {
   \ 'colorscheme': 'molokai',
   \ 'active': {
      \ 'left': [ [ 'mode', 'paste' ],
      \  [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ }
   \ }

"color
let g:deus_termcolors=256
let g:deus_improved_warnings=1
let g:indentLine_color_term='#928374'
set background=dark    " Setting dark mode
colorscheme deus
highlight Normal guibg=NONE ctermbg=None
