" Core
set nocompatible
syntax enable
filetype plugin on
filetype plugin indent on
set backupcopy=yes
set directory=~/.config/nvim/swapfiles//
set undofile
set undodir=~/.config/nvim/undo
set undolevels=1000
set undoreload=10000
set updatetime=100 "vim-gitgutter

" Interface
set laststatus=2 "Display StatusLine at all times
set ruler
set number
set relativenumber
set noequalalways "Do not equalize on splitting
set splitbelow
set splitright
set winwidth=80
set winheight=20
set noshowmode "hide ugly INSERT alert
set nohlsearch
set completeopt=

" Fuzzy file search
set path+=**
set wildmenu
set wildmode=list:longest,full
set wildignore+=**/node_modules/**
set wildignore+=**/target/**
set wildignore+=**/resources/public/**

" Remove annoyance from GUI
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Mail
autocmd FileType mail setl linebreak tw=0

" Macros
" (^r^ra to paste from register a in insert mode)
let @c="dt#elD0ys$'A,j0"

fun! Indent2()
  setlocal ts=2 sw=2 sts=2 et
endfun
fun! Indent4()
  setlocal ts=4 sw=4 sts=4 et
endfun

" set background=dark
" colorscheme bubblegum-256-dark

" if has('gui_running')
"     set background=dark
"     set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
" endif

" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()
  " Games!!!
  Plug 'thanthese/Tortoise-Typing' " :TortoiseTyping
  Plug 'johngrib/vim-game-code-break' " :VimGameCodeBreak
  " Colorschemes
  Plug 'NLKNguyen/papercolor-theme'
  " Interface
  Plug 'scrooloose/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  " Plug 'airblade/vim-gitgutter', { 'commit': '932ffaca092cca246b82c33e23d2d3a05e192e08' }
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'lervag/vimtex'
  Plug 'uosl/vim-slime'
  " Plug 'ervandew/supertab'
  Plug 'w0rp/ale'
  Plug 'wellle/targets.vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'garbas/vim-snipmate'
  Plug 'rhysd/clever-f.vim'
  Plug 'uosl/split-term.vim'
  Plug 'moll/vim-bbye'
  Plug 'Asheq/close-buffers.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
  " JavaScript
  Plug 'kchmck/vim-coffee-script'
  " Plug 'othree/yajs.vim', {
  "       \ 'for': ['javascript', 'javascript.jsx'],
  "       \ 'commit': 'c5b6719e1ad66b82cbc435b92b3bf2a7ab98696c' }
  " Plug 'othree/javascript-libraries-syntax.vim'
  " Plug 'othree/es.next.syntax.vim', {
  "       \ 'commit': '902d18ec0750da3ffe57ab734805e7f13bd25f3f' }
  " Plug 'gavocanov/vim-js-indent'
  " Plug 'tymarats/vim-jsx'
  Plug 'pangloss/vim-javascript'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'mxw/vim-jsx'
  " Plug 'styled-components/vim-styled-components'
  Plug 'Quramy/vim-js-pretty-template'
  Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
  " TypeScript
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'leafgarland/typescript-vim' " alternative highlighting
  " Plug 'Quramy/tsuquyomi' " for IDE features
  " HTML
  Plug 'Valloric/MatchTagAlways' "sudo pip install neovim
  Plug 'docunext/closetag.vim'
  " JSON
  Plug 'tpope/vim-jdaddy'
  " CSS
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'hail2u/vim-css3-syntax', {
        \ 'commit': 'ed97cb7' }
  Plug 'ap/vim-css-color', {
        \ 'commit': '2411b84' }
  " Vue
  Plug 'posva/vim-vue'
  " Clojure
  Plug 'guns/vim-clojure-static'
  " Plug 'tpope/vim-fireplace'
  " Plug 'gregspurrier/vim-midje'
  Plug 'eraserhd/parinfer-rust', {
    \ 'do': 'cargo build --release',
    \  }
  Plug 'clojure-vim/async-clj-omni'
  " Plug 'radenling/vim-dispatch-neovim'
  " Plug 'clojure-vim/vim-jack-in'
  " Plug 'venantius/vim-cljfmt'
  " Racket
  Plug 'wlangstroth/vim-racket'
  " Haskell
  Plug 'neovimhaskell/haskell-vim'
  " Graphql
  Plug 'jparise/vim-graphql'
  " IMBA
  Plug 'simeng/vim-imba'
  " Reason
  Plug 'uosl/vim-reason-plus', {
    \ 'branch': 'fix-indent',
    \ }
  " Plug 'autozimu/LanguageClient-neovim', {
  "   \ 'branch': 'next',
  "   \ 'do': 'bash install.sh',
  "   \ }
  " Go
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " Elm
  Plug 'elmcast/elm-vim'
  " Python
  Plug 'vim-python/python-syntax'
  "Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
  " " (Optional) Multi-entry selection UI.
  Plug 'liuchengxu/vim-clap'
  Plug 'dominikduda/vim_current_word'
  Plug 'guns/vim-sexp', {'for': 'clojure'}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'liquidz/vim-iced-kaocha', {'for': 'clojure'}
  " Plug 'junegunn/fzf'
  " " (Completion plugin option 1)
  Plug 'roxma/nvim-completion-manager', { 'for': 'reason' }
call plug#end()

set background=light
colorscheme PaperColor

" Enhanced syntax highlighting
" hi javascriptVariable ctermfg=110
" hi javascriptIdentifierName ctermfg=182
" hi javascriptBlock ctermfg=60

" Filetype definitions
au BufNewFile,BufRead *.dust set filetype=html
au BufNewFile,BufRead *.ejs  set filetype=html
au BufNewFile,BufRead .eslintrc set filetype=json
" " Workaround for vim-js-pretty-template:
" au FileType javascript.jsx syn clear javascriptTemplate
" au FileType javascript.jsx JsPreTmpl scss

au BufNewFile,BufRead *.css,*.less,*.sass,*.scss,*.erl call Indent4()

" REPL definitions
au TermOpen *clj set filetype=clojure
au TermOpen *erl set filetype=erlang
au TermOpen *rtop set filetype=reason
au TermOpen *utop set filetype=ocaml
au TermOpen *ghci set filetype=haskell
au TermOpen *mzscheme set filetype=scheme
au TermOpen *mit-scheme set filetype=scheme
au TermOpen *sbcl set filetype=lisp
au TermOpen *node set filetype=javascript
au TermOpen *python,*python3 set filetype=python

" Javascript
let g:jsx_ext_required = 0
let g:used_javascript_libs = 'react,vue,underscore,d3,flux,jasmine,ramda,jquery,backbone'

" pretty-template
if has('autocmd')
  " Support `-` in css property names
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  call jspretmpl#register_tag('gql', 'graphql')
  autocmd FileType javascript.jsx JsPreTmpl
  autocmd FileType javascript JsPreTmpl
endif

" " Slime
let g:slime_target = "neovim"

" " Prettier
" " Style rules
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#parser = 'babylon'
" " Force async and disable quickfix window
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
" " Run before saving
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.graphql,*.vue PrettierAsync

" " Match HTML elements
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript': 1,
    \ 'javascript.jsx': 1,
    \ 'php': 1
    \}
hi MatchParen ctermfg=235 ctermbg=146

" Clojure
let g:clojure_fuzzy_indent_patterns = ['^with', '^def', '^let', 'loop$', '^fn', '^ns', '^if-let$', 'testing', 'wait-for', 'async']
let g:clojure_syntax_keywords = {
  \ 'clojureMacro': ["defroutes"]
  \ }
let g:iced_enable_default_key_mappings = v:true
let g:iced_default_key_mapping_leader = '<LocalLeader>'
let g:iced#nrepl#auto#does_switch_session = v:true
" vim-cljfmt
let g:clj_fmt_autosave = 0

" Python
let g:python_highlight_all = 1

" " Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" auto pairs
au Filetype clojure let b:AutoPairs = {"\"": "\""}
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" " Paredit
" " Do not move closing parenthesis to next line
let g:paredit_electric_return = 0
" " Allow jumping to any type of bracket with ()
let g:paredit_smartjump = 1

" " Fireplace
" au User FireplacePreConnect call fireplace#register_port_file(expand('~/.lein/repl-port'), '/')

" " Iced
" autocmd BufWritePre *.clj,*.cljs,*.cljc IcedFormatAll | w

" " Rainbow parentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax *.clj RainbowParenthesesLoadRound
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',    'DarkOrchid3'],
    \ ['darkcyan',   'firebrick3'],
    \ ['darkred',    'RoyalBlue3'],
    \ ['darkmagenta',     'SeaGreen3'],
    \ ['brown', 'DarkOrchid3'],
    \ ['Darkblue',       'firebrick3'],
    \ ['darkgreen',        'RoyalBlue3'],
    \ ['darkcyan',       'SeaGreen3'],
    \ ['darkred', 'DarkOrchid3'],
    \ ['darkmagenta',    'firebrick3'],
    \ ['brown',   'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgreen',     'DarkOrchid3'],
    \ ]

" Airline
let g:airline_extensions = [ 'ale', 'branch', 'hunks', 'tabline', 'term', 'tmuxline' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'jsformatter' " show parent directory if filename is index.js
let g:airline_section_y = 0 " do not display file encoding[fileformat]
let g:airline_theme = 'papercolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {
        \ 'maxlinenr': ' L',
        \ 'readonly': 'RO',
        \ 'linenr': '',
        \ 'branch': 'BR',
        \ 'whitespace': 'WS'}
endif

let g:tmuxline_powerline_separators = 0

" Clever-f
" Quickly cancel find
map ' <Plug>(clever-f-reset)

" vim-clap
let g:clap_theme = 'solarized_light'

" vim_current_word
let g:vim_current_word#highlight_current_word = 0

" vim-better-whitespace
" Paying attention to whitespace is silly.
" Just strip it from lines we edit!
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitespace_confirm=0

" supertab
" let g:SuperTabDefaultCompletionType = "<c-n>"

" coc.nvim
set hidden
set pumheight=10
" don't give |ins-completion-menu| messages.
set shortmess+=c
" Reference with `:h coc-configuration`.
let g:coc_user_config = {
  \ 'suggest.noselect': 0,
  \ 'suggest.maxCompleteItemCount': 15,
  \ 'languageserver': {
  \   'clojure-lsp': {
  \     'command': 'bash',
  \     'args': ['-c', 'clojure-lsp'],
  \     'filetypes': ['clojure'],
  \     'disableDiagnostics': 1,
  \     'disableCompletion': 0,
  \     'rootPatterns': ['project.clj', 'deps.edn'],
  \     'additionalSchemes': ['jar', 'zipfile'],
  \     'trace.server': 'verbose',
  \     'initializationOptions': {
  \       'ignore-classpath-directories': 1
  \     }
  \   }
  \ }
\ }
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use `[r` and `]r` to navigate list (ie. references)
nmap <silent> [r :CocPrev<CR>
nmap <silent> ]r :CocNext<CR>
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR :CocListResume<CR>
nmap <silent> gn <Plug>(coc-rename)
nmap <silent> ge <Plug>(coc-refactor)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " " " " " "
" Bindings  "
" " " " " " "

" Quickly switch windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Leader mappings
let mapleader = ";"
let maplocalleader = "'"

" Ale
" Set linters
let g:ale_linters = {'clojure': ['clj-kondo']}
" Navigate between linting errors quickly
nmap <Leader><C-j> <Plug>(ale_next_wrap)
nmap <Leader><C-k> <Plug>(ale_previous_wrap)

" Prettier
nmap <Leader>P <Plug>(Prettier)

" Unbind and rebind PrettierAsync command
" (when you wish to temporarily disable it)
nnoremap <Leader><C-p> :call ToggleEnablePrettierAsync()<cr>

let g:prettier_async_is_enabled = 1
function! ToggleEnablePrettierAsync()
  if g:prettier_async_is_enabled
    delcommand PrettierAsync
    let g:prettier_async_is_enabled = 0
  else
    command! -nargs=? -range=% PrettierAsync call prettier#Prettier(1, <line1>, <line2>)
    let g:prettier_async_is_enabled = 1
  endif
endfunction

" vim-easy-align
" " Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" close-buffers.vim
nnoremap <Leader><C-b> :CloseBuffersMenu<CR>

" Fireplace
" nnoremap <Leader>Cpb :CljEval (cider.piggieback/cljs-repl (figwheel-sidecar.repl-api/repl-env))<CR>

" Iced
nnoremap <LocalLeader><M-'> :IcedStartCljsRepl figwheel-sidecar<CR>
nmap <LocalLeader>er <Plug>(iced_eval_and_replace)<Plug>(sexp_inner_element)

" Fugitive
nnoremap <Leader>gs :belowright :Gstatus<CR>
nnoremap <Leader>gvs :vertical :Gstatus<CR>
nnoremap <Leader>gi :Git config --list<CR>
nnoremap <Leader>gC :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gD :Git! diff --cached<CR>
nnoremap <Leader>gL :Glog --<CR>
nnoremap <Leader>gl :0Glog<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gW :Gwrite<CR>
nnoremap <Leader>gm :Gmerge 
nnoremap <Leader>gr :Grebase 
nnoremap <Leader>gc :Git checkout 
nnoremap <Leader>gB :Git branch 
nnoremap <Leader>gP :Gpush<CR>
nnoremap <Leader>gp :Gpull<CR>
nnoremap <Leader>gR :Gpull --rebase<CR>
nnoremap <Leader>gSP :Git stash push<CR>
nnoremap <Leader>gSp :Git stash push -m "
nnoremap <Leader>gSl :Git stash list<CR>
nnoremap <Leader>gS<C-p> :Git stash pop<CR>
nnoremap <Leader>gSa :Git stash apply<CR>

" Navigation
nnoremap <Leader>j 10j
nnoremap <Leader>k 10k
nnoremap <Leader>e 10<C-e>
nnoremap <Leader>y 10<C-y>

" Insert mode navigation
inoremap <C-a> <Home>
inoremap <C-e> <End>

" File navigation
nnoremap <Leader>E :e %:h/
nnoremap <Leader>N :new %:h/
nnoremap <Leader>V :vnew %:h/

" Window
nnoremap <Leader>c <C-w>q
nnoremap <Leader>s <C-w>s
nnoremap <Leader>v <C-w>v
nnoremap <Leader>H <C-w>H
nnoremap <Leader>J <C-w>J
nnoremap <Leader>K <C-w>K
nnoremap <Leader>L <C-w>L
nnoremap <Leader>R <C-w>R
nnoremap <Leader><C-t> :NERDTree<CR>
nnoremap <Leader><C-f> :NERDTreeFind<CR>
nnoremap <Leader>t <C-w>t

" Buffers
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>o :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
nnoremap <Leader>q :bdelete<CR>
" :bd without closing window
nnoremap <Leader>d :Bdelete<CR>
nnoremap <Leader>Q :q<CR>

" Sessions
nnoremap <Leader><C-s><C-s> :mks! ~/.config/nvim/sessions/_quicksave<CR>
nnoremap <Leader><C-s><C-l> :so ~/.config/nvim/sessions/_quicksave<CR>

" clap
nnoremap <Leader>ff :Clap files<CR>
nnoremap <Leader>fl :Clap blines<CR>
nnoremap <Leader>fc :Clap command<CR>
nnoremap <Leader>fh :Clap command_history<CR>
nnoremap <Leader>fg :Clap grep<CR>
nnoremap <Leader>fj :Clap jumps<CR>
nnoremap <Leader>fL :Clap lines<CR>
nnoremap <Leader>fb :Clap buffers<CR>
nnoremap <Leader>fq :Clap quickfix<CR>
nnoremap <Leader>fr :Clap registers<CR>
nnoremap <Leader>fy :Clap yanks<CR>

" Quickly open terminal in directory of file
" nnoremap <Leader>C :terminal $SHELL -c "cd `dirname %`; $SHELL"<CR>

" vim-slime job id handling for neovim terminal
nnoremap <Leader>zi :echo b:terminal_job_id<CR>
nnoremap <Leader>zs :let b:slime_config["jobid"] = input("jobid: ", b:slime_config["jobid"])<CR>

" grep for visual mode selection in working directory
vnoremap <Leader>* y:grep -r --exclude-dir=node_modules '<C-r>"' .<CR>

nnoremap <Leader>C :new ~/.config/nvim/init.vim<CR>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
"nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>else<Bar> set nohls<Bar>endif<CR>
"function! AutoHighlightToggle()
"  let @/ = ''
"  if exists('#auto_highlight')
"    au! auto_highlight
"    augroup! auto_highlight
"    setl updatetime=4000
"    echo 'Highlight current word: off'
"    return 0
"  else
"    augroup auto_highlight
"      au!
"      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
"    augroup end
"    setl updatetime=500
"    echo 'Highlight current word: ON'
"    return 1
"  endif
"endfunction

" Display syntax information under cursor
nnoremap <Leader>hs :echo "name: hi<"
  \ . synIDattr(synID(line("."),col("."),1),"name") . "> trans<"
  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">\nfg: hi<"
  \ . synIDattr(synID(line("."),col("."),1),"fg") . "> trans<"
  \ . synIDattr(synID(line("."),col("."),0),"fg") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg") . ">\nbg: hi<"
  \ . synIDattr(synID(line("."),col("."),1),"bg") . "> trans<"
  \ . synIDattr(synID(line("."),col("."),0),"bg") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"bg") . ">"<CR>

" LanguageClient-neovim
" let g:LanguageClient_autoStart = 1
" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['ocaml-language-server', '--stdio'],
"     \ 'ocaml': ['ocaml-language-server', '--stdio'],
"     \ }

"\ 'rust': ['rustup', 'run', 'nightly', 'rls'],
"\ 'javascript': ['javascript-typescript-stdio'],
"\ 'javascript.jsx': ['javascript-typescript-stdio'],

" autocmd BufWritePre *.re :call LanguageClient_textDocument_formatting()

" nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
" nnoremap <silent> g<cr> :call LanguageClient_textDocument_hover()<cr>

let g:clipboard = {
  \   'name': 'xclip-xfce4-clipman',
  \   'copy': {
  \      '+': 'xclip -selection clipboard',
  \      '*': 'xclip -selection clipboard',
  \    },
  \   'paste': {
  \      '+': 'xclip -selection clipboard -o',
  \      '*': 'xclip -selection clipboard -o',
  \   },
  \   'cache_enabled': 1,
  \ }

" Mail

" Add format option 'w' to add trailing white space, indicating that paragraph
" continues on next line. This is to be used with mutt's 'text_flowed' option.
augroup mail_trailing_whitespace " {
    autocmd!
    autocmd FileType mail setlocal formatoptions+=w
    autocmd FileType mail setlocal textwidth=80
    autocmd FileType mail CocDisable
augroup END " }
