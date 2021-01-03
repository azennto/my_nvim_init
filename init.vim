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

"競技プログラミング系
nmap <C-z> :/\(solve\\|input!\)<CR>ji<Tab>

"ショートカット
nmap sh :w<CR>:vertical rightbelow Tnew<CR><C-w><C-w>
nmap er :LspDocumentDiagnostics<CR>
nmap ss :w<CR>
nmap it gg=G`.


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

	"-----------
	"deoplete.vim
	"----------
	call dein#add('Shougo/deoplete.nvim')
	if !has('nvim')
		call dein#add('roxma/nvim-yarp')
		call dein#add('roxma/vim-hug-neovim-rpc')
	endif
	"----------

	"----------
	"NeoSnippet
	"----------
	call dein#add('Shougo/neosnippet.vim')
	call dein#add('Shougo/neosnippet-snippets')
	"----------

	"----------
	"vim-airline
	"----------
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')
	"----------

	"----------
	"ayu-vim
	"----------
	call dein#add('ayu-theme/ayu-vim')
	"----------
	
	"----------
	"indentLine
	"----------
	call dein#add('Yggdroot/indentLine')
	"----------
	
	"----------
	"vim-auto-save
	"----------
	call dein#add('vim-scripts/vim-auto-save')
	"----------
	
	"----------
	"rust.vim
	"----------
	call dein#add('rust-lang/rust.vim')
	"----------
	
	"----------
	"lsp
	"----------
	call dein#add('prabirshrestha/vim-lsp')
	call dein#add('mattn/vim-lsp-settings')
	"----------

	"----------
	"NERDTree
	"----------
	call dein#add('preservim/nerdtree')
	call dein#add('Xuyuanp/nerdtree-git-plugin')
	call dein#add('ryanoasis/vim-devicons')
	call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
	"----------
	
	"----------
	"neoterm
	"----------
	call dein#add('kassio/neoterm')
	"----------

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

"----------
"deoplete.vim
"----------
" Use deoplete.
let g:deoplete#enable_at_startup = 1

"----------
"NeoSnippet
"----------
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" プレビューを表示しない
set completeopt-=preview
"----------

"----------
"vim-airline
"----------
"タブを表示する
let g:airline#extensions#tabline#enabled = 1

"タブのセパレータの形を指定する
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

"パスの表示を指定する
let g:airline#extensions#tabline#formatter = 'unique_tail'

"nerdfontを使う
let g:airline_powerline_fonts = 1
"----------

"----------
"vim-auto-save
"----------
"let g:auto_save = 1
"let g:auto_save_events = ["TextChanged"]
"----------

"----------
"NERDTree
"----------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" NERDTreeを自動で開く
autocmd VimEnter * NERDTree

" NERDTreeだけになったらvimを終了
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" gitの表示
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" gitの表示にnerdフォントを使う
let g:NERDTreeGitStatusUseNerdFonts = 1
"----------

"----------
"neoterm
"----------
"縦分割
let g:neoterm_default_mod='tab'
"ESCでターミナルモードを抜けるため
tnoremap <silent> <ESC> <C-\><C-n><C-w>
"----------

"----------
"ayu-vim
"----------
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
"autocmd ColorScheme * highlight Normal guibg=NONE
"autocmd ColorScheme * highlight NonText guibg=NONE
"autocmd ColorScheme * highlight LineNr guibg=NONE
"autocmd ColorScheme * highlight Folded guibg=NONE
"autocmd ColorScheme * highlight EndOfBuffer guibg=NONE 
"autocmd ColorScheme * highlight Terminal guibg=NONE
autocmd ColorScheme * highlight Comment guifg=#5fc7a6
autocmd ColorScheme * highlight LineNr guifg=#3fabe0
autocmd ColorScheme * highlight NERDTreeOpenable guifg=#a5d2d4
autocmd ColorScheme * highlight NERDTreeUp guifg=#a5d2d4
autocmd ColorScheme * highlight NERDTreeDir guifg=#a5d2d4
autocmd ColorScheme * highlight NERDTreeFile guifg=#a5d2d4
autocmd ColorScheme * highlight NERDTreeDirSlash guifg=#3D4751
colorscheme ayu
"----------

"----------
"Indent Line
"----------
let g:indentLine_char = 'ǀ'
let g:indentLine_first_char = 'ǀ'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
"----------
