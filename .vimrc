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
" set autochdir
set cscoperelative

" 设置tab=8个空格，不要自动转换成空格 "
set tabstop=8
set shiftwidth=8
set noexpandtab

" switch user and kernel coding style "
nnoremap <F6> :set tabstop=4<CR>:set shiftwidth=4<CR>:set expandtab<CR>
nnoremap <F7> :set tabstop=8<CR>:set shiftwidth=8<CR>:set noexpandtab<CR>

" vim-plug "
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/taglist.vim'
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open=1
let Tlist_Use_Right_Window = 0
Plug 'inkarkat/vim-mark'
Plug 'inkarkat/vim-ingo-library'
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
Plug 'ludovicchabant/vim-gutentags'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
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

"update cscope databases when press F8
map <F8> :!cscope -Rbq<CR><CR>:cs reset<CR><CR>

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

" map cscope
nmap <C-j>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-j>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-j>i :cs find i <C-R>=expand("<cfile>")<CR><CR>

" map fzf
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fb :BLines<CR> 
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR> 
nnoremap <leader>f? :GFiles?<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fc :Commits<CR>

" map pwd
nnoremap <leader>p :echo expand('%:p')<CR>


"if has("cscope")
"	set csprg=/usr/bin/cscope
"	set csto=0
"	set cst
"	set csverb
"	set cspc=3
"	"add any database in current dir
"	if filereadable("cscope.out")
"		cs add cscope.out
"		"else search cscope.out elsewhere
"	"	let current_directory = expand('%:p:h')
"	"	if current_directory =~# '/mnt/d/Project/k2pro/generic_nic_framwork.*'
"	"	echo "xxx"
"	"	let g:cscope_connection = '/mnt/d/Project/linux/cscope.out'
"	"	cs add /mnt/d/Project/linux/cscope.out -C /mnt/d/Project/linux/cscope.out
"	"	set tags+=/mnt/d/Project/linux/tags
"	endif
"else
"	let cscope_file=findfile("cscope.out", ".;")
"	let cscope_pre=matchstr(cscope_file, ".*/")
"	if !empty(cscope_file) && filereadable(cscope_file)
"		exe "cs add" cscope_file cscope_pre
"	endif
"endif

" 在 vim 配置文件中判断当前路径是否为 genei
"if expand('%:p:h') =~# '/generic_nic_framwork/'
"	echo "xxx"
"	exe "set tags+=/mnt/d/Project/linux/tags"
"	exe "cs add /mnt/d/Project/linux/cscope.out -C /mnt/d/Project/linux/cscope.out"
"elseif expand('%:p:h') =~# '/generic_nic_framwork' 
"	echo "yyy"
"	exe "cs add /mnt/d/Project/linux/cscope.out -C /mnt/d/Project/linux/cscope.out"
"endif

" 🤖
"if [[ cwd == "generic_nic_framwork" ]]; then
"	set tags+=/mnt/d/Project/linux/tags
"	cs add /mnt/d/Project/linux/cscope.out -C /mnt/d/Project/linux/cscope.out
"elif [[ dir == "yusur_dpdk" ]]; then
"fi

set path+=/mnt/d/Project/linux/
" source ~/.cscope.sh

" vimrc文件修改之后自动加载 "
autocmd! bufwritepost .vimrc source %
