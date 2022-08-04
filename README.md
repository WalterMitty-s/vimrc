## INSTALL

Get vim plug to manage the plugins:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

open a doc with vim and run command:

```
:PlugInstall
```

Get an Awesome version  https://github.com/amix/vimrc

```
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## USEAGE

Search file in vim:
"\"+"f"

Search symbol in vim:
'Ctrl+f' and 'Enter'

Select target with:
'Ctrl+j' and 'Ctrl+k'

and jump to taget with:
'Enter'

Jump back with:
'Ctrl+o'

To enable ctags for a project, please put a empty ".root" file in projet
root directory, then the vim will generate the Ctags automatically.

## Troubleshoot

### python support

Debian 9:

```
Error: LeaderF requires vim compiled with +python or +python3
```

Need install vim plugin to fix

```
sudo apt install vim-nox
```

Another options is:

```
sudo apt install vim-gnome-py2
```
### taglist

Error detected while processing function <SNR>29_Tlist_Refresh_Folds
```shell
diff --git a/plugin/taglist.vim b/plugin/taglist.vim
index 59901f6..dd8e72c 100644
--- a/plugin/taglist.vim
+++ b/plugin/taglist.vim
@@ -4097,6 +4097,10 @@ endfunction
 " window. Used after entering a tab. If this is not done, then the folds
 " are not properly created for taglist windows displayed in multiple tabs.
 function! s:Tlist_Refresh_Folds()
+    if g:Tlist_Show_One_File
+        return
+    endif
+
     let winnum = bufwinnr(g:TagList_title)
     if winnum == -1
         return
```

### vim-mark

Error detected while processing /Users/renjianing/.vim/plugged/vim-mark/plugin/mark.vim:
line  264:
E227: Mapping already exists for ,m
line  267:
E227: Mapping already exists for ,m
line  274:
E227: Mapping already exists for ,r
line  277:
E227: Mapping already exists for ,n
Press ENTER or type command to continue

modify vim.mark located at `~/.vim/plugged/vim-mark/plugin`

```c
diff --git a/plugin/mark.vim b/plugin/mark.vim
index cb24e6e..6d97f44 100644
--- a/plugin/mark.vim
+++ b/plugin/mark.vim
@@ -261,20 +261,20 @@ if exists('g:mw_no_mappings')
 endif

 if !hasmapto('<Plug>MarkSet', 'n')
-       nmap <unique> <Leader>m <Plug>MarkSet
+       nmap <Leader>m <Plug>MarkSet
 endif
 if !hasmapto('<Plug>MarkSet', 'x')
-       xmap <unique> <Leader>m <Plug>MarkSet
+       xmap <Leader>m <Plug>MarkSet
 endif
 " No default mapping for <Plug>MarkIWhiteSet.
 if !hasmapto('<Plug>MarkRegex', 'n')
-       nmap <unique> <Leader>r <Plug>MarkRegex
+       nmap <Leader>r <Plug>MarkRegex
 endif
 if !hasmapto('<Plug>MarkRegex', 'x')
-       xmap <unique> <Leader>r <Plug>MarkRegex
+       xmap <Leader>r <Plug>MarkRegex
 endif
 if !hasmapto('<Plug>MarkClear', 'n')
-       nmap <unique> <Leader>n <Plug>MarkClear
+       nmap <Leader>n <Plug>MarkClear
 endif
 " No default mapping for <Plug>MarkAllClear.
 " No default mapping for <Plug>MarkConfirmAllClear.
```
