" vim起動時のみruntimepathにneobundle.vimを追加
filetype off

if has('vim_starting')
  set runtimepath+=D:\Software\tools\vim\vim74-kaoriya-win64\bundle\neobundle.vim
" neobundle.vimの初期化
" NeoBundleを更新するための設定
call neobundle#begin(expand('D:\Software\tools\vim\vim74-kaoriya-win64\bundle'))
        NeoBundleFetch 'Shougo/neobundle.vim'
" call neobundle#end()
endif

" 読み込むプラグインを記載
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'mattn/emmet-vim'
" 対応カッコをハイライトする
NeoBundle 'vim-scripts/Highlight-UnMatched-Brackets'
" 検索結果が見やすくなり助かる
NeoBundle 'osyo-manga/vim-anzu'
" 辞書。 Shift-k で表示される
NeoBundle 'thinca/vim-ref'
"インデントの視覚化 ============================
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'

" markdown関連
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'


" wordpress 投稿
NeoBundle 'pentie/VimRepress'


" vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1
"==========================インデントの視覚化ここまで

"行末の不要な半角スペースを可視化 ===============
NeoBundle 'bronson/vim-trailing-whitespace'
call neobundle#end()
"=============== 行末の不要な半角スペースを可視化ここまで

" 読み込んだプラグインも含め、ファイルタイプの検出、ファイルタイプ別プラグイン/インデントを有効化する
filetype plugin indent on

" インストールのチェック
NeoBundleCheck

" 検索数を出させるやつ！========================
" lightline.vim関連 {{{
let g:lightline = {
    \ 'colorscheme': 'landscape',
    \ 'active': {
    \   'left': [
    \       ['mode', 'paste'],
    \       ['readonly', 'filename', 'modified', 'anzu']
    \   ]
    \ },
    \ 'component_function': {
    \   'anzu': 'anzu#search_status'
    \ }
    \ }
"}}}

" vim-anzu関連 {{{
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
augroup vim-anzu
" 一定時間キー入力がないとき、ウインドウを移動したとき、タブを移動したときに
" 検索ヒット数の表示を消去する
    autocmd!
    autocmd CursorHold,CursorHoldI,WinLeave,TabLeave * call anzu#clear_search_status()
augroup END
"}}}
"==========================検索数を出させるやつ！ここまで
"

"コメントアウト・アンコメント======
"NeoBundle 'scrooloose/nerdcommenter'
"nerdcommenter用 cc でコメントorコメントアウト
"let NERDSpaceDelims = 1
"nmap cc <Plug>NERDCommenterToggle
"vmap cc <Plug>NERDCommenterToggle
"======コメントアウト・アンコメントここまで

"==========================ファイル保存時にフォルダ自動作成ここから
"https://vim-jp.org/vim-users-jp/2011/02/20/Hack-202.html
"開いて保存しなかった場合にディレクトリが残るﾊﾟﾀﾝ
augroup vimrc-auto-mkdir  " {{{
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'))
  function! s:auto_mkdir(dir)  " {{{
    if !isdirectory(a:dir)
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction  " }}}
augroup END  " }}}

"保存するときに聞いてくれるﾊﾟﾀﾝ
"augroup vimrc-auto-mkdir  " {{{
"  autocmd!
"  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
"  function! s:auto_mkdir(dir, force)  " {{{
"    if !isdirectory(a:dir) && (a:force ||
"    \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
"      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
"    endif
"  endfunction  " }}}
"augroup END  " }}}
"==========================ファイル保存時にフォルダ自動作成ここまで
