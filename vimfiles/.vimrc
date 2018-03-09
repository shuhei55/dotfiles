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

"自動で閉じ括弧を入力
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"キーマッピング
noremap <S-h>  ^
noremap <S-j>  }
noremap <S-k>  {
noremap <S-l>  $

"最後のカーソル位置を復元する
if has("autocmd")
    autocmd BufReadPost *
    \if line("'\"") > 0 && line ("'\"") <= line("$")
    \  exe "normal! g'\"" |
    \ endif
endif

"vimshell
"noremap :sh :VimShell

"NERDTree
noremap <silent><C-t> :NERDTree<CR>

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
"NeoBundle 'Shougo/vimshell' vim中にshellを使える
NeoBundle 'mattn/sonictemplate-vim' "テンプレートプログラムが使えるようになる
let g:sonictemplate_vim_template_dir = ['~/.vim/template']

NeoBundle 'simeji/winresizer' "<C-e> でサイズ変更
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

NeoBundle 'scrooloose/nerdtree' "<C-t>でツリー表示
NeoBundle 'thinca/vim-quickrun' "vimを閉じずに実行
NeoBundle 'tomtom/tcomment_vim' "複数行のコメントアウト
NeoBundle 'tomasr/molokai' "color
NeoBundle 'sjl/badwolf'
NeoBundle 'w0ng/vim-hybrid'

" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'taketwo/vim-ros'


call neobundle#end()

"color
colorscheme molokai

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
