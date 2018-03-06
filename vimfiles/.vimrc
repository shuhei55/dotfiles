"普通の
set expandtab
set tabstop=4
set shiftwidth=4
set ignorecase
set smartcase
set background=dark
set number
set cursorline
set smartindent
set showmatch

"キーマッピング
noremap <S-h>  ^
noremap <S-j>  }
noremap <S-k>  {
noremap <S-l>  $

"clang-format"
autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp :ClangFormat

"plugin
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

NeoBundle 'Shougo/vimproc.vim', {
            \     'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
			\     'cygwin' : 'make -f make_cygwin.mak',
			\     'mac' : 'make',
			\     'linux' : 'make',
			\     'unix' : 'gmake',
            \    },
            \ }
NeoBundle 'Shougo/vimshell'

" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'taketwo/vim-ros'


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
