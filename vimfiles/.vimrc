"普通の
set title "タイトル表示
set expandtab "タブ系
set tabstop=4
set shiftwidth=4
set ignorecase "検索で大文字小文字を区別しない（小文字のときはせず、大文字のときはする）
set smartcase
set background=dark "暗くする
set number "行番号をふる
set cursorline "カーソルの行がわかる！
set smartindent "自動でインデント
"set showmatch "対応する括弧がわかる！(このversionでは効かない)
"set matchtime=1
let loaded_matchparen = 1 "対応するのを表示しない
"Shift-uで対応へ移動
noremap <S-u> %

"自動で閉じ括弧を入力
"imap { {}<LEFT>
"imap [ []<LEFT>
"imap ( ()<LEFT>

"キーマッピング
noremap <S-h>  ^
noremap <S-j>  }
noremap <S-k>  {
noremap <S-l>  $
nnoremap <C-m> :<C-u>tabnew<CR> "タブを開くよ
nnoremap <C-n> gt "タブを動くよ
nnoremap <C-N> gT "タブを動くよ


"最後のカーソル位置を復元する
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END


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
let NERDTreeShowHidden = 1 "不可視ファイルの表示
NeoBundle 'jistr/vim-nerdtree-tabs' "タブ間でツリー共有
NeoBundle 'Xuyuanp/nerdtree-git-plugin' "ツリーに変更を表示

NeoBundle 'Yggdroot/indentLine' "インデントの深さがわかる！

"NeoBundle 'thinca/vim-quickrun' "vimを閉じずに実行
NeoBundle 'tomtom/tcomment_vim' "複数行のコメントアウト
NeoBundle 'rhysd/accelerated-jk' "カーソルの移動速度アップ
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

NeoBundle 'vim-airline/vim-airline' "かっこいい
let g:airline#extensions#tabline#enabled = 1 "タブバーも

NeoBundle 'tomasr/molokai' "color
NeoBundle 'sjl/badwolf' "color
NeoBundle 'w0ng/vim-hybrid' "color
NeoBundle 'joshdick/onedark.vim' "color

" NeoBundle 'itchyny/lightline.vim'
" NeoBundle 'taketwo/vim-ros'


call neobundle#end()

"color
colorscheme onedark

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
