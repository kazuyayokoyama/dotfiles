colorscheme molokai
" colorscheme jellybeans

" set background=dark
" colorscheme solarized

" http://d.hatena.ne.jp/ruicc/20080202/1201971501
if has('multi_byte_ime') || has('xim')
    highlight CursorIM guibg=DarkCyan guifg=NONE
endif

if has('gui_macvim')
    set transparency=10
    set guifont=Menlo:h12
    set guioptions-=T
endif

set textwidth=1000
set columns=200
set lines=155
set wrap            " 長い行を折り返して表示 (nowrap:折り返さない)
set visualbell t_vb=  " Beep音を消して、さらに画面のフラッシュもしない

" NERDTree
"" 隠しファイルを表示する
"let NERDTreeShowHidden = 1
"" 引数なしで実行したとき、NERDTreeを実行する
"let file_name = expand("%:p")
"if has('vim_starting') &&  file_name == ""
"    autocmd VimEnter * execute 'NERDTree ./'
"endif

