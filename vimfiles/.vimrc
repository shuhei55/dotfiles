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


autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp :ClangFormat
