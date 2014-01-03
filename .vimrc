"-------------------------------------------------------------------
" Memo
"-------------------------------------------------------------------
" [Buffer]
" :ls                       - バッファ一覧を表示
" :b1                       - バッファを選択（1の部分は数字）
" [Search/Replace]
" /pattern                  - patternを検索
" ?pattern                  - patternを逆向きに検索
" n                         - 次を検索
" N                         - 前を検索
" g/<search>/<command>      - g は search 条件に当てはまる行ごとに command が実行される
" v/<search>/<command>      - v は search 条件に当てはまらない行ごとに command が実行される
" :%s/old/new/g             - ファイル全体のoldをnewに置換
" :%s/old/new/gc            - ファイル全体のoldをnewに置換(確認しながら)


"-------------------------------------------------------------------
" Bundles
"-------------------------------------------------------------------
set nocompatible               " be iMproved

" vimshell
let g:VimShell_EnableInteractive = 1

" neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'gmarik/vundle'
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" YankRing
NeoBundle 'YankRing.vim'
" Ctrl+P, Ctrl+N

" neocomplcache
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'

" Zen-coding
NeoBundle 'mattn/emmet-vim'
" usage: http://motw.mods.jp/Vim/emmet-vim.html
" Ctrl+y, Ctrl+,

" fontzoom.vim
" +、-で拡大、縮小、:Fontzoom!でリセット、あとはCtrl押しながらマウスのスクロール
NeoBundle 'thinca/vim-fontzoom'
" indent-guides.vim
NeoBundle 'nathanaelkane/vim-indent-guides'

" Objective-C
"NeoBundle 'cocoa.vim'
" Cmd + Opt + ↑ - .hファイルと.mファイルのトグル
" Cmd + r        - ビルドand実行
" Cmd + b        - ビルド
" Cmd + 0        - XCode起動
" Cmd + 2        - :ListMethods

" Shell
NeoBundle 'Shougo/vimshell'
" :VimShell

" Filer
NeoBundle 'scrooloose/nerdtree'
" ?               - help

" Buffer
NeoBundle 'fholgado/minibufexpl.vim'

" browser
NeoBundle 'open-browser.vim'
" gx <url>

" surround
NeoBundle 'tpope/vim-surround'
" d + s + 囲んでるもの
" ds'                 - 今カーソルのある文字列を囲んでいる ' を消す
" ds"                 - " を消す
" ds(                 - () を消す
" dst                 - <tag> を消す
" c + s + 囲んでるもの + 変更したいもの
" cs'"                - 今囲んでいる ' を " に変える
" cs"<tag>            - 今囲んでいる " を <tag> に変える
" cst<tag>            - 直近で囲まれてるタグを <tag> に変える
" ysiw"               - h*oge  →  "hoge""
" {ysa{( or ysaB      - b *:foo => 'bar' }  →  ( { :foo => 'bar' } )
" ys$"                - He said, *i am John.  →  He said, "i am John."
" yss'                - hello  →  'hello'
" ySSt                - カレント行をタグで囲い改行する
" インサートモードでC-G, s or S  閉じタグの自動補完
" hoge  S<div> <div>hoge</div> これがかなり便利

" JavaScript
" syntax
" NeoBundle 'JavaScript-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
" indent
" NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jiangmiao/simple-javascript-indenter'
" CoffeeScript
NeoBundle 'kchmck/vim-coffee-script'
" quickrun for node.js
NeoBundle 'thinca/vim-quickrun'

" unite
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tsukkee/unite-help'
NeoBundle 'h1mesuke/unite-outline'
" Ctrl+f カレントのファイラーを開く
" Ctrl+b バッファを開く（これはよく使う）

" vimfiler
NeoBundle 'Shougo/vimfiler'

" Hex code to color
NeoBundle 'skammer/vim-css-color'

" Grammer check
NeoBundle 'scrooloose/syntastic'

" 必要になったら使う
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'tell-k/vim-browsereload-mac'

" html/css
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'taichouchou2/html5.vim'


filetype plugin indent on     " required!
filetype indent on
syntax on

"-------------------------------------------------------------------------------
" 全般設定
"-------------------------------------------------------------------------------
set nocompatible            " 必ず最初に書く（vi互換コードを解除）
set viminfo='20,<50,s10,h,! " YankRing用に!を追加
set shellslash              " Windowsでディレクトリパスの区切り文字に / を使えるようにする
set lazyredraw              " マクロなどを実行中は描画を中断
set number        " 行番号を非表示
set ruler        " ルーラーを表示 (noruler:非表示)
set cmdheight=2      " コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set laststatus=2    " 常にステータス行を表示 (詳細は:he laststatus)
" via http://kadoppe.com/archives/2013/09/vimrc-2.html
set lazyredraw
set ttyfast

" 折りたたみ関連
set nofoldenable
set foldmethod=indent
set foldopen=all  " fold内に移動すれば自動で開く
" set foldclose=all  " fold外に移動しfoldlevelより深ければ閉じる
set foldlevel=1   " 折りたたみの具合
set foldnestmax=2  " 最大折りたたみ深度$
set foldcolumn=2  " 左側に折りたたみガイド表示$

" ウィンドウを移動するタイミングで再読み込み
" via http://vim-users.jp/2011/03/hack206/
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"-------------------------------------------------------------------------------
" コマンド補完
"-------------------------------------------------------------------------------
set wildmenu           " コマンド補完を強化
set wildmode=list:full " リスト表示，最長マッチ
set tags=~/.tags,tags


"-------------------------------------------------------------------------------
" 検索
"-------------------------------------------------------------------------------
set ignorecase  " 大文字小文字無視
set smartcase  " 大文字ではじめたら大文字小文字無視しない
set wrapscan  " 最後まで検索したら先頭へ戻る
"set nowrapscan  " 検索をファイルの先頭へループしない
set hlsearch  " 検索文字をハイライト
set incsearch  " インクリメンタルサーチ

"-------------------------------------------------------------------------------
" タブ
"-------------------------------------------------------------------------------
set autoindent
set cindent    " C言語的なインデント
set expandtab    " タブを空白文字に展開
set tabstop=2   " タブ文字の幅を設定できます。デフォルトは8です。
set softtabstop=2   " タブ文字を入力した際にタブ文字の代わりに挿入されるホワイトスペースの量を設定します。
set shiftwidth=2    " >> 等のコマンドや自動インデントの際に使う1レベル分のインデント量を設定します。
set shiftround
set smarttab
set nowrap

if has("autocmd")
  "ファイルタイプの検索を有効にする
  filetype plugin on
  "そのファイルタイプにあわせたインデントを利用する
  filetype indent on
  " これらのftではインデントを無効に
  "autocmd FileType php filetype indent off

  autocmd FileType markdown   setlocal sw=4 sts=4 ts=4 et
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType php        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType snippet    setlocal sw=4 sts=4 ts=4 et
endif

" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge


"-------------------------------------------------------------------------------
" backup
"-------------------------------------------------------------------------------
set backup
set backupdir=~/.vim_backup
set swapfile
set directory=~/.vim_swap
"set nobackup   " バックアップ取らない
"set autoread   " 他で書き換えられたら自動で読み直す
"set noswapfile " スワップファイル作らない
"set hidden     " 編集中でも他のファイルを開けるようにする


"-------------------------------------------------------------------------------
" 色
"-------------------------------------------------------------------------------
" syntax color
syntax on
"colorscheme molokai  " .gvimrcに書かないと反映されないのでコメントアウト
highlight LineNr ctermfg=darkgrey


"-------------------------------------------------------------------------------
" 移動設定
"-------------------------------------------------------------------------------
" deleteボタンが遠いんだ！
nmap <C-H> <BS>

" 0, 9で行頭、行末へ
nmap 1 ^
nmap 9 $

"-------------------------------------------------------------------------------
" 編集関連
"-------------------------------------------------------------------------------
set showmatch      " 括弧の対応をハイライト
set backspace=indent,eol,start
set clipboard=unnamed
set pastetoggle=<F12>
set guioptions+=a

" insertモードを抜けるとIMEオフ
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" コンマの後に自動的にスペースを挿入
inoremap , ,<Space>
" XMLの閉タグを自動挿入
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
augroup END

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 線を引く
inoremap <F8> <C-R>=repeat('-', 80 - virtcol('.'))<CR>

"-------------------------------------------------------------------------------
" その他
"-------------------------------------------------------------------------------
" ;でコマンド入力( ;と:を入れ替)
noremap ; :

" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"改行コードの自動認識
if has("win32") || has("win64")
  set fileformats=dos
else
  set fileformats=mac,unix,dos
endif

" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif

" 括弧入力後に←に移動
imap {} {}<Left>
imap [] []<Left>
" imap () ()<Left>
imap "" ""<Left>
imap '' ''<Left>
imap <> <><Left>

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ファイルタイプ
nnoremap ,js :<C-u>set filetype=javascript<CR>
nnoremap ,css :<C-u>set filetype=css<CR>
nnoremap ,html :<C-u>set filetype=html<CR>

" now
nnoremap <F2> "=strftime("%Y/%m/%d %H:%M:%S")<CR>P
inoremap <F2> <C-R>=strftime("%Y/%m/%d %H:%M:%S")<CR>

" 無限アンドゥ
if has('persistent_undo')
  set undodir=~/.vim/undo
  set undofile
endif

" ↓キーでシンタックスチェック
au FileType html :compiler tidy
au FileType html :setlocal makeprg=tidy\ -raw\ -quiet\ -errors\ --gnu-emacs\ yes\ \"%\"
au FileType html :map <down> <esc>:make<cr>
au FileType css :compiler css
au FileType css :map <down> <esc>:make<cr>
"au FileType javascript :compiler javascriptlint
"au FileType javascript :map <down> <esc>:make<cr>
au FileType php        :map <down> <esc>:!php  -l %<cr>
au FileType perl       :map <down> <esc>:!perl -c %<cr>
au FileType ruby       :map <down> <esc>:!ruby -c %<cr>
au FileType javascript :map <down> <esc>:make %<cr>

" ↑キーで実行
au FileType php        :map <up> <esc>:!php  %<cr>
au FileType perl       :map <up> <esc>:!perl %<cr>
au FileType ruby       :map <up> <esc>:!ruby %<cr>
au FileType javascript :map <up> <esc>:!node %<cr>

" ESC*2 でハイライトやめる
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>

" encoding
nmap ,U :set encoding=utf-8<CR>
nmap ,E :set encoding=euc-jp<CR>
nmap ,S :set encoding=cp932<CR>
nmap ,J :set fileencoding=iso-2022-jp<CR>

" fileencoding
nmap ,fU :set fileencoding=utf-8<CR>
nmap ,fE :set fileencoding=euc-jp<CR>
nmap ,fS :set fileencoding=cp932<CR>
nmap ,fJ :set fileencoding=iso-2022-jp<CR>

" fileformat
nmap ,fu :set fileformat=unix<CR>
nmap ,fd :set fileformat=dos<CR>
nmap ,fm :set fileformat=mac<CR>

"u 検索時に勝手にエスケープさせる
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'

" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

" バッファの移動
nmap <C-b> :ls<CR>:buf

"-------------------------------------------------------------------------------
" plugin
"-------------------------------------------------------------------------------
" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'perl'     : $HOME . '/dotfiles/dict/perl.dict',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" for snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


""" Unite.vim
" 起動時にインサートモードで開始しない
let g:unite_enable_start_insert = 1

" インサート／ノーマルどちらからでも呼び出せるようにキーマップ
nnoremap <silent> <C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
inoremap <silent> <C-f> <ESC>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> <C-e> :<C-u>Unite buffer file_mru<CR>
inoremap <silent> <C-e> <ESC>:<C-u>Unite buffer file_mru<CR>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
" ブックマーク一覧
nnoremap <silent> ,uc :<C-u>Unite bookmark<CR>
" ブックマーク追加
nnoremap <silent> ,ud :<C-u>UniteBookmarkAdd<CR>
" 全部乗せ
nnoremap <silent> ,ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

"file current_dir
"noremap <silent> ,ufc :<C-u>Unite file -buffer-name=file<CR>
noremap <silent> ,ufc :<C-u>Unite file<CR>
noremap <silent> ,ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

" unite.vim上でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " 単語単位からパス単位で削除するように変更
  imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
  " ESCキーを2回押すと終了する
  nmap <silent><buffer> <ESC><ESC> q
  imap <silent><buffer> <ESC><ESC> <ESC>q
endfunction

" unite-plugins
nnoremap <silent> ,uh :<C-u>Unite help<CR>
" Markdownなどを解析してアウトラインを表示してくれる、むちゃくちゃ便利
" via http://qiita.com/items/2cebdb805f45e7b4b901
nnoremap <silent> ,uo :<C-u>Unite outline<CR>


" emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-Y>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
      \ 'lang' : 'ja',
      \ 'html' : {
      \   'filters' : 'html',
      \ },
      \ 'css' : {
      \   'filters' : 'fc',
      \ },
      \ 'php' : {
      \   'extends' : 'html',
      \   'filters' : 'html',
      \ },
      \}
augroup EmmitVim
  autocmd!
  autocmd FileType * let g:user_emmet_settings.indentation = '  '[:&tabstop]
augroup END

" surround.vim
" ssで選択範囲を指定文字でくくる
nmap ss <Plug>Yssurround

if !has("win32") && !has("win64")
  " vimshell
  " シェルを起動
  nnoremap <silent> ,vs :VimShell<CR>
  " Scalaを起動
  nnoremap <silent> ,vscala :VimShellInteractive scala<CR>
  " SpiderMonkeyを起動
  nnoremap <silent> ,vjs :VimShellInteractive js<CR>
endif

" コメントアウトを切り替えるマッピング例
"nmap <Leader>c <Plug>(caw:I:toggle)
"vmap <Leader>c <Plug>(caw:I:toggle)
nmap ,c <Plug>(caw:I:toggle)
vmap ,c <Plug>(caw:I:toggle)

if has("gui_macvim") || has("win32") || has("win64")
  " indent-guides.vim
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_color_change_percent = 30
  let g:indent_guides_guide_size = 1
endif

" VimFiler
nnoremap <F3> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

" quickrun
let g:quickrun_config = {}
let g:quickrun_config[ 'javascript' ] = { "command": "node", "tempfile": "{tempname()}.js" }
let g:quickrun_config[ 'html' ] = { 'command' : 'open', 'exec' : '%c %s', 'outputter': 'browser' }

" Simple-Javascript-Indenter
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

" open-browser {{{
" refs http://d.hatena.ne.jp/tyru/20100619/git_push_vim_plugins_to_github
nmap <Space>w <Plug>(openbrowser-open)
vmap <Space>w <Plug>(openbrowser-open)
"}}}

