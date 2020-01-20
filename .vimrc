set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

try
source ~/.vim_runtime/my_configs.vim
catch
endtry

set cc=80
set cursorline 
set showcmd
set showmatch
set autochdir

" 设置tab=8个空格，不要自动转换成空格 "
set tabstop=8
set shiftwidth=8
set noexpandtab

" vim-plug "
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window = 0
"Plug 'inkarkat/vim-mark'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'iamcco/markdown-preview.vim'
nmap <silent> <F8> :MarkdownPreview<CR>
nmap <silent> <F9> :MarkdownPreviewStop<CR>
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 1
let g:mkdp_open_to_the_world = 1
call plug#end()

" 显示行数，用f2开启/关闭 "
set number
nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" 显示tab和行尾空格，用f3开启/关闭 "
set listchars=tab:»■,trail:■
nnoremap <F3> :set list!<Cr>

" taglist，用f4开启/关闭 "
map <F4> <Esc>:TlistToggle<Cr>

" 使用鼠标，用f5关闭/开启 "
set mouse=a
nnoremap <F5> :exec &mouse=='a' ? ':set mouse-=a' : ':set mouse=a'<CR>

" resize horzontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Right> <C-W>><C-W>>
nmap <C-Left> <C-W><<C-W><

" open recent used file
nmap <C-n> :tabedit<CR>,f

nmap <C-h> gT
nmap <C-l> gt

set path+=/usr/local/opt/ffmpeg/include
set path+=/Volumes/Code/kernel/include
set path+=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include

" vimrc文件修改之后自动加载 "
autocmd! bufwritepost .vimrc source %
