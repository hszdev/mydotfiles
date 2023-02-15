if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
filetype plugin on
set grepprg=grep\ -nH\ $*
filetype indent on
let g:tex_flavor='latex --pdf'
let g:Tex_DefaultTargetFormat='pdf'
let g:vimtex_compiler_method='latexmk --pdf'
set nocompatible

" ---- Plug plugin manager
call plug#begin()
Plug 'vim-airline/vim-airline' " -- Airline statusbar 
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' | " --- NERDTree plugin https://github.com/preservim/nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin' | " --- show git related info on NERDTree https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'ryanoasis/vim-devicons' " --- Add devicons to files and folders https://github.com/ryanoasis/vim-devicons
Plug 'unkiwii/vim-nerdtree-sync' " --- Sync NERDTree with the current open file
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " ---- https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim' " ---- https://github.com/junegunn/fzf.vim
Plug 'mg979/vim-visual-multi', {'branch': 'master'} " --- Better multi cursor support https://github.com/mg979/vim-visual-multi
Plug 'neoclide/coc.nvim', {'branch': 'release'} " ---- https://github.com/neoclide/coc.nvim (nodejs is required :[)
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': ':CocInstall coc-yaml coc-vimtex'}
Plug 'NLKNguyen/papercolor-theme' " --- PaperColor theme for vim https://github.com/vim-scripts/PaperColor.vim
Plug 'lervag/vimtex' " -  Vimtex plugin
Plug 'sheerun/vim-polyglot' " - Language support for vim
call plug#end()
" ---- Vimtex configuration
filetype plugin indent on
syntax enable

let g:deoplete#enable_at_startup = 1

let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_method = 'latexmk'   " - Latexmk as compiler
let maplocalleader = ","                    " - Replace the \ with , for using commands

" ---- Coc plugins

" ---- switching between split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ---- nerd tree setting
autocmd vimenter * NERDTree " - always enter NERDTree when vim opens
autocmd BufWinEnter * NERDTreeMirror " - open NERDTree when you open something is a new tab
map <C-o> :NERDTreeToggle %<CR>     " - Toggle NERDTree with control+o
let g:NERDTreeNotificationThreshold = 500 " - Limit NERDTree caching
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " - Close NERDTree if it is the last tab

" - Tab navigations
map <C-l> gt<CR>
map <C-h> gT<CR>
map <C-p> :Buffer<CR>

" Settings for NERDTree sync
let g:nerdtree_sync_cursorline = 1
let g:NERDTreeHighlightCursorline = 1

" " use <c-space>for trigger completion inoremap
inoremap <silent><expr> <c-space> coc#refresh()

set number
set laststatus=2
set noshowmode
set showmatch " - show mathcing parentheses
set textwidth=80 " ---- set textwidth to 80

" ---- rebinding jumpfoward
if !hasmapto('<Plug>IMAP_JumpForward', 'i')
    imap <C-F> <Plug>IMAP_JumpForward
endif
if !hasmapto('<Plug>IMAP_JumpForward', 'n')
    nmap <C-F> <Plug>IMAP_JumpForward
endif

" ---- custom imaps
"  - Insert something in place here
:nnoremap <Space> i_<Esc>r 
map ; :Files<CR> 

" ---- unmap macro

          
" ---- color theme
set background=dark " --- make the standard colorscheme for vim dark
colorscheme PaperColor " - use the PaperColor theme

" --- airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_theme='jellybean'

" ---- tab settings
set tabstop=4
set shiftwidth=4
set expandtab
