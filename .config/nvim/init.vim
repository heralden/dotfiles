" Core
set nocompatible
"syntax enable "Don't use together with treesitter
filetype plugin on
filetype plugin indent on
set backupcopy=yes
set directory=~/.config/nvim/swapfiles//
set undofile
set undodir=~/.config/nvim/undo
set undolevels=1000
set undoreload=10000
set updatetime=100 "vim-gitgutter
set iskeyword+=- "Treat dash-separated as words

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
" set completeopt=
set completeopt=menu,menuone,noselect "Recommended for nvim-cmp

" Fuzzy file search
set path+=**
set wildmenu
set wildmode=list:longest,full
set wildignore+=**/node_modules/**
set wildignore+=**/target/**
set wildignore+=**/resources/public/**
set wildignore+=**/tools/**

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

" Filetype definitions
au BufNewFile,BufRead *.dust set filetype=html
au BufNewFile,BufRead *.ejs  set filetype=html
au BufNewFile,BufRead .eslintrc set filetype=json

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
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'lervag/vimtex'
  Plug 'uosl/vim-slime'
  Plug 'w0rp/ale'
  Plug 'wellle/targets.vim'
  Plug 'MarcWeber/vim-addon-mw-utils'
  Plug 'tomtom/tlib_vim'
  Plug 'rhysd/clever-f.vim'
  Plug 'uosl/split-term.vim'
  Plug 'moll/vim-bbye'
  Plug 'bdlangton/close-buffers.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
  " JavaScript
  Plug 'kchmck/vim-coffee-script'
  Plug 'prettier/vim-prettier', {
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
  " HTML
  Plug 'Valloric/MatchTagAlways' "Requires neovim pip package
  Plug 'docunext/closetag.vim'
  " JSON
  Plug 'tpope/vim-jdaddy'
  " CSS
  Plug 'ap/vim-css-color', {
        \ 'commit': '2411b84' }
  " Clojure
  Plug 'eraserhd/parinfer-rust', {
    \ 'do': 'cargo build --release',
    \  }
  " Haskell
  Plug 'neovimhaskell/haskell-vim'
  " IMBA
  Plug 'simeng/vim-imba'
  " Reason
  Plug 'uosl/vim-reason-plus', {
    \ 'branch': 'fix-indent',
    \ }
  " Elm
  Plug 'elmcast/elm-vim'
  Plug 'dominikduda/vim_current_word'
  Plug 'guns/vim-sexp', {'for': 'clojure'}
  Plug 'tpope/vim-sexp-mappings-for-regular-people', {'for': 'clojure'}
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  Plug 'liquidz/vim-iced-function-list', {'for': 'clojure', 'on': 'IcedBrowseFunction'}
  Plug 'liquidz/vim-iced-kaocha', {'for': 'clojure'}
  " Plug 'junegunn/fzf'
  " " (Completion plugin option 1)
  Plug 'roxma/nvim-completion-manager', { 'for': 'reason' }
  " Neovim LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-vsnip'
  Plug 'hrsh7th/vim-vsnip'
  " Treesitter
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
  Plug 'nvim-treesitter/playground'
  " Telescope
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Treesitter
" TSInstall bash c c_sharp clojure comment commonlisp cpp css dart dockerfile elixir erlang fennel go gomod gowork graphql html http java javascript jsdoc json julia kotlin latex lua make nix ocaml perl php python r regex ruby rust scala scss sparql svelte toml tsx turtle typescript vim vue yaml
lua << EOF
  require'nvim-treesitter.configs'.setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    ensure_installed = { "bash", "c", "c_sharp", "clojure", "comment", "commonlisp", "cpp", "css", "dart", "dockerfile", "elixir", "erlang", "fennel", "go", "gomod", "gowork", "graphql", "html", "http", "java", "javascript", "jsdoc", "json", "julia", "kotlin", "latex", "lua", "make", "nix", "ocaml", "perl", "php", "python", "r", "regex", "ruby", "rust", "scala", "scss", "sparql", "svelte", "toml", "tsx", "turtle", "typescript", "vim", "vue", "yaml" },

    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
      enable = true,
      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
EOF

" nvim-cmp and lspconfig
lua << EOF
  ---------------------
  -- Setup nvim-cmp. --
  ---------------------
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<C-o>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  ----------------------
  -- Setup lspconfig. --
  ----------------------
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  local flags = { debounce_text_changes = 150 }

  -- Use an on_attach function to only map the following keys after the language server attaches to the current buffer.
  local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end

  -- To add more, see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  -- Useful but requires more manual setup: r_language_server, rust_analyzer, groovyls, java_language_server, kotlin_language_server, quick_lint_js (if not covered by tsserver), perlpls
  require'lspconfig'.bashls.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.clojure_lsp.setup       { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.cssls.setup             { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.dockerls.setup          { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.eslint.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.gopls.setup             { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.graphql.setup           { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.html.setup              { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.jsonls.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.ocamlls.setup           { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.pyright.setup           { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.racket_langserver.setup { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.rust_analyzer.setup     { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.sqls.setup              { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.svelte.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.tailwindcss.setup       { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.texlab.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.tflint.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.tsserver.setup          { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.vimls.setup             { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.vuels.setup             { capabilities = capabilities, flags = flags, on_attach = on_attach}
  require'lspconfig'.yamlls.setup            { capabilities = capabilities, flags = flags, on_attach = on_attach}
EOF

" filetype-specific autocompletion
autocmd FileType markdown lua require('cmp').setup.buffer {
      \ sources = { { name = 'path' } } }
autocmd FileType mail lua require('cmp').setup.buffer {
      \ sources = {} }

" telescope mappings
lua << EOF
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
      }
    }
  },
}
EOF

set background=light
colorscheme PaperColor
" Make papercolor look better with treesitter
highlight TSPunctDelimiter ctermfg=36 guifg=#00ad7f
highlight TSPunctSpecial ctermfg=23 guifg=#004e3d
highlight TSTagDelimiter ctermfg=23 guifg=#004257
highlight TSConstBuiltin ctermfg=238 guifg=#4c3d3d
highlight TSConstructor ctermfg=238 cterm=bold gui=bold guifg=#533636
highlight TSVariableBuiltin ctermfg=237 guifg=#5d2d2d
highlight TSStringRegex ctermfg=94 guifg=#855f00
highlight TSLiteral ctermfg=64 guifg=#508500
highlight TSMethod ctermfg=237 cterm=italic gui=italic guifg=#573232
highlight TSField ctermfg=24 guifg=#004785
highlight TSProperty ctermfg=18 guifg=#002885
highlight TSParameterReference ctermfg=24 guifg=#005685
highlight TSAttribute ctermfg=24 guifg=#185d95
highlight TSTag ctermfg=60 guifg=#305b7e
highlight TSKeywordFunction ctermfg=240 guifg=#40596d
highlight TSKeywordOperator ctermfg=45 guifg=#1ac9ff
highlight TSTypeBuiltin ctermfg=126 guifg=#b0277d
highlight TSNamespace ctermfg=124 guifg=#b71f1f
" Lovely pink keywords in Clojure
highlight TSSymbol ctermfg=162 guifg=#d70087

" " Slime
let g:slime_target = "neovim"

" " Prettier
" " Style rules
let g:prettier#config#semi = 'true'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#parser = 'babylon'
" " Force async and disable quickfix window
let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
" " Run before saving
let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.graphql,*.vue PrettierAsync

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
let g:iced_enable_auto_indent = v:false " cljfmt is slow

" auto pairs
au Filetype clojure let b:AutoPairs = {"\"": "\""}
au Filetype vim let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'", "`":"`", '```':'```', '"""':'"""', "'''":"'''"}

" " Paredit
" " Do not move closing parenthesis to next line
let g:paredit_electric_return = 0
" " Allow jumping to any type of bracket with ()
let g:paredit_smartjump = 1

" " Iced
" autocmd BufWritePre *.clj,*.cljs,*.cljc IcedFormatAll | w

" Airline
let g:airline_extensions = [ 'ale', 'branch', 'hunks', 'tabline', 'term', 'tmuxline' ]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'jsformatter' " show parent directory if filename is index.js
let g:airline_section_y = 0 " do not display file encoding[fileformat]
let g:airline_theme = 'papercolor'
let g:tmuxline_powerline_separators = 0

" Clever-f
" Quickly cancel find
map ' <Plug>(clever-f-reset)

" vim_current_word
let g:vim_current_word#highlight_current_word = 0
hi CurrentWordTwins ctermfg=NONE ctermbg=254 cterm=underline

" vim-better-whitespace
" Paying attention to whitespace is silly.
" Just strip it from lines we edit!
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitespace_confirm=0

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
" " conflict with vim-bbye
let g:close_buffers_bdelete_command = 'CBdelete'
let g:close_buffers_bwipeout_command = 'CBwipeout'
nnoremap <Leader><C-b> :CloseBuffersMenu<CR>

" vimtex
let g:tex_flavor = 'latex'

" Iced
nnoremap <LocalLeader><M-'> :IcedStartCljsRepl figwheel-sidecar<CR>
nmap <LocalLeader>er <Plug>(iced_eval_and_replace)<Plug>(sexp_inner_element)

" Fugitive
nnoremap <Leader>gs :belowright :Git<CR>
nnoremap <Leader>gvs :vertical :Git<CR>
nnoremap <Leader>gi :Git config --list<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gD :Git! diff --cached<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gm :Git merge
nnoremap <Leader>gr :Git rebase
nnoremap <Leader>gc :Git checkout 
nnoremap <Leader>gB :Git branch 
nnoremap <Leader>gw :Git switch
nnoremap <Leader>g<C-p> :Git push -u origin HEAD<CR>
nnoremap <Leader>gP :Git push<CR>
nnoremap <Leader>gp :Git pull<CR>
nnoremap <Leader>gR :Git pull --rebase<CR>
nnoremap <Leader>gU :Git pull upstream HEAD<CR>
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

" Quickfix
nnoremap <Leader>ww :copen<CR>
nnoremap <Leader>wq :cclose<CR>

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

" telescope
nnoremap <leader>fF <cmd>Telescope resume<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fc <cmd>Telescope commands<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fG <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope search_history<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fq <cmd>Telescope quickfix<cr>
nnoremap <leader>fj <cmd>Telescope jumplist<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>fl <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

" Quickly open terminal in directory of file
" nnoremap <Leader>C :terminal $SHELL -c "cd `dirname %`; $SHELL"<CR>

" vim-slime job id handling for neovim terminal
nnoremap <Leader>zi :echo b:terminal_job_id<CR>
nnoremap <Leader>zs :let b:slime_config["jobid"] = input("jobid: ", b:slime_config["jobid"])<CR>

" grep for visual mode selection in working directory
vnoremap <Leader>* y:grep -r --exclude-dir=node_modules '<C-r>"' .<CR>

nnoremap <Leader>C :new ~/.config/nvim/init.vim<CR>

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

let g:clipboard = {
  \   'name': 'unnamed',
  \   'copy': {
  \      '+': 'pbcopy',
  \      '*': 'pbcopy',
  \    },
  \   'paste': {
  \      '+': 'pbpaste',
  \      '*': 'pbpaste',
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
augroup END " }
