set rtp+=~/.vim/bundle/Vundle.vim " - include vundle in runtime path

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

" ---- Plug plugin manager
call plug#begin()
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomasiser/vim-code-dark'
Plug 'https://github.com/jsnal/vim-serape', { 'tag': 'v0.2.2' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " ---- https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf.vim' " ---- https://github.com/junegunn/fzf.vim
Plug 'terryma/vim-multiple-cursors' " ---- https://github.com/terryma/vim-multiple-cursors
" - Plug 'neoclide/coc.nvim', {'branch': 'release'} " ---- https://github.com/neoclide/coc.nvim (nodejs is required :[)
call plug#end()

" ---- Vundle plugins
call vundle#begin()
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()

" ---- switching between split windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" ---- nerd tree setting
autocmd vimenter * NERDTree " - always enter NERD tree when vim opens

set number
set background=dark
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
:nnoremap <Space> i_<Esc>r
map ; :Files<CR> 

" ---- unmap macro


" ---- YouCompleteMe options
"  Filetypes YouCompleteMe ignore
let g:ycm_filetype_blacklist = { 
      \ 'tex': 0,
      \}

" ---- colo theme
" - colorscheme serape 
colorscheme codedark
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }

