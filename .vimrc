set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.nvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin '1995eaton/vim-better-javascript-completion'
Plugin 'elzr/vim-json'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'scrooloose/nerdcommenter'

" Typescript
Plugin 'leafgarland/typescript-vim'
Plugin 'Shougo/vimproc.vim', {
     \ 'build' : {
     \     'windows' : 'tools\\update-dll-mingw',
     \     'cygwin' : 'make -f make_cygwin.mak',
     \     'mac' : 'make -f make_mac.mak',
     \     'linux' : 'make',
     \     'unix' : 'gmake',
     \    },
     \ }

" colorscheme & syntax highlighting
Plugin 'mhartington/oceanic-next'
" Plugin 'gosukiwi/vim-atom-dark'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'chrisbra/Colorizer'
Plugin 'Yggdroot/indentLine'
Plugin 'Raimondi/delimitMate'

" Git helpers
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" untils
Plugin 'matze/vim-move'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Quramy/tsuquyomi'

Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" End plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


call vundle#end()            " required
filetype plugin indent on    " required


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim untils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','
" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" set lazyredraw
set syntax=whitespace
set noswapfile
set showcmd
set backspace=indent,eol,start
filetype on
set relativenumber number
set tabstop=2
set shiftwidth=2
set expandtab
set conceallevel=0
let g:vim_json_syntax_conceal = 0

" enable mouse
set mouse=a

" Theme
syntax enable
colorscheme OceanicNext
set background=dark

" Copy to osx clipboard
set pastetoggle=<leader>p
vnoremap <C-c> "*y<CR>
highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
highlight clear SignColumn

" Git gitgutter column colors
call gitgutter#highlight#define_highlights()

" This is the best
nnoremap ; :
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
set wildmenu
set laststatus=2
set colorcolumn=100
set wrap linebreak nolist
set virtualedit=
set display+=lastline

" Navigate between display lines
noremap  <silent> <Up>   gk
noremap  <silent> <Down> gj
noremap  <silent> k gk
noremap  <silent> j gj
noremap  <silent> <Home> g<Home>
noremap  <silent> <End>  g<End>
inoremap <silent> <Up>   <C-o>gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Home> <C-o>g<Home>
inoremap <silent> <End>  <C-o>g<End>
" no need to fold things in markdown all the time
let g:vim_markdown_folding_disabled = 1
autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell
autocmd BufRead,BufNewFile *.txt setlocal spell complete+=kspell
let g:move_key_modifier = 'S'

let g:jsx_ext_required = 0
let g:used_javascript_libs = 'react'

set wildignore+=*.o,*.a,*.obj,*/.git/*,*/node_modules/*,*.class,*.zip,*.aux

" change cursor shape to pipe on insert mode
:let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-\> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make files look nice
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css,scss,sass :ColorHighlight
noremap <c-f> :Autoformat<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript & Javscript omni complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimjs#casesensistive = 1

let g:vimjs#smartcomplete = 0
let g:vimjs#chromeapis = 0
autocmd FileType typescript inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
let g:typescript_indent_disable = 1

"  let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
let g:neocomplete#sources#syntax#min_keyword_length = 3

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.typescript = '\h\w*\|[^. \t]\.\w*'

autocmd FileType typescript setlocal completeopt-=preview


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP & GREP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = 'ag %s -i --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore lib
    \ -g ""'
  let g:ctrlp_regexp = 1
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_switch_buffer = 0
  let g:ackprg = 'ag --nogroup --column'
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap <leader>a :Ag<space>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='oceanicnext'
" make sure to escape the spaces in the name properly
set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h11
" Tabline part of vim-airline
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>x :bp <BAR> bd #<CR>
" This replaes :tabnew which I used to bind to this mapping
nmap <leader>n :enew<cr>
" Move to the next buffer
nmap <leader>, :bnext<CR>
" Move to the previous buffer
nmap <leader>. :bprevious<CR>
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 0

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '!'

noremap <leader>t :SyntasticToggleMode<CR>

function! JscsFix()
  let l:winview = winsaveview()
  % ! jscs -x
  call winrestview(l:winview)
endfunction
command JscsFix :call JscsFix()

noremap <leader>f :JscsFix<CR>
" autocmd BufWritePre *.js,*.jsx JscsFix

let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss','html'] }
map <Leader>e :lnext<CR>
map <Leader>E :lprev<CR>
