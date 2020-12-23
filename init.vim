"   (_)___  (_) /__   __(_)___ ___ 
"  / / __ \/ / __/ | / / / __ `__ \
" / / / / / / /__| |/ / / / / / / /
"/_/_/ /_/_/\__(_)___/_/_/ /_/ /_/ 


"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" ヤンクをクリップボードに打ち込む
set clipboard+=unnamed
" xで削除したものをクリップボードに載せない
nnoremap x "_x

" 見た目系
" 行番号を表示
set number
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトの有効化
syntax on


" Tab系
" 何文字のスペースでtabとするか
set tabstop=2
" tabがスペース何文字分か
set shiftwidth=2
set noexpandtab


" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" ハイライトを表示しない
set nohlsearch

"競技プログラミング系
nmap <C-z> :/\(solve\\|input!\)<CR>ji<Tab>

"ショートカット
nmap sh :bel vert term<CR>
nmap er :LspDocumentDiagnostics<CR>


"----------
"dein.vim
"----------
"dein Scripts-----------------------------
if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/azennto/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/azennto/.cache/dein')
	call dein#begin('/Users/azennto/.cache/dein')

	" Let dein manage dein
	" Required:
	call dein#add('/Users/azennto/.cache/dein/repos/github.com/Shougo/dein.vim')
	" Required:
	call dein#end()
	call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
