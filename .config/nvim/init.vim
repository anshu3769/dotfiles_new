" source vimrc for everything
" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vimrc

" Vim configuration
" Author :Anshu Tomar

" General: Leader mappings -------------------- {{{

let mapleader = "g"
let maplocalleader = "\\"

" }}}

" General: global config ------------ {{{
function! SetGlobalConfig()

  " Enable filetype detection, plugins and indentation
  filetype plugin indent on

  set completeopt=menuone,longest,preview

  " Enable buffer deletion instead of having to write each buffer
  set hidden

  " Set relative number
  set relativenumber

  " Not necessary for Neovim
  set encoding=UTF-8

  " Disable swap files
  set nobackup
  set noswapfile

  " Mouse: enable GUI mouse support in all modes
  set mouse=a

  " Do not wrap lines by default
  setlocal wrap linebreak

  " Settings for spaces and tabs
  set shiftwidth=4 " number of spaces to indent when vim auto-indents
  set softtabstop=4 " hitting tab inserts 4 spaces
  set tabstop=8 " tab characters are represented as 4 spaces
  set expandtab " tabs are spaces

  " Line highlights
  set cursorline

  " Remove query for terminal version
  " This prevents un-editable garbage characters from being printed
  " after the 80 character highlight line
  set t_RV=

  " Single space after periods
  set nojoinspaces

  set spelllang=en_us

  " Display tabline
  set showtabline=2

  set autoread

  " When you type the first tab hit will complete as much as possible,
  " the second tab hit will provide a list, the third and subsequent tabs
  " will cycle through completion options so you can complete the file
  " without further keys
  set wildmode=longest,list,full
  set wildmenu

  " Turn off complete vi compatibility
  set nocompatible

  " Enable using local vimrc
  set exrc

  " Make sure numbering is set
  set number

  " no timeout on key mappings
  set notimeout

  " coc related
  set cmdheight=2
  set updatetime=300
  set shortmess+=c
  set signcolumn=yes

  " Set column to light grey at 80 characters
  if (exists('+colorcolumn'))
    set colorcolumn=80
    highlight ColorColumn ctermbg=9
  endif
endfunction

call SetGlobalConfig()

" Enable true color "
if $COLORTERM ==# 'truecolor'
  set termguicolors
else
  set guicursor=
endif

" }}}

" General: Filetype recognition{{{
augroup filetype_recognition
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.hql,*.q set filetype=hive
  autocmd BufNewFile,BufRead,BufEnter *.config,.cookiecutterrc set filetype=yaml
  autocmd BufNewFile,BufRead,BufEnter .jrnl_config,*.bowerrc,*.babelrc,*.eslintrc,*.slack-term
        \ set filetype=json
  autocmd BufNewFile,BufRead,BufEnter *.asm set filetype=nasm
  autocmd BufNewFile,BufRead,BufEnter *.handlebars set filetype=html
  autocmd BufNewFile,BufRead,BufEnter *.m,*.oct set filetype=octave
  autocmd BufNewFile,BufRead,BufEnter *.jsx set filetype=javascript
  autocmd BufNewFile,BufRead,BufEnter *.gs set filetype=javascript
  autocmd BufNewFile,BufRead,BufEnter *.cfg,*.ini,.coveragerc,*pylintrc
        \ set filetype=dosini
  autocmd BufNewFile,BufRead,BufEnter *.tsv set filetype=tsv
  autocmd BufNewFile,BufRead,BufEnter *.toml set filetype=toml
  autocmd BufNewFile,BufRead,BufEnter Dockerfile.* set filetype=Dockerfile
  autocmd BufNewFile,BufRead,BufEnter Makefile.* set filetype=make
  autocmd BufNewFile,BufRead,BufEnter poetry.lock set filetype=toml
  autocmd BufNewFile,BufRead,BufEnter .gitignore,.dockerignore
        \ set filetype=conf
  autocmd BufNewFile, BufRead, BufEnter *.py.j2 set filetype=python.jinja2
augroup END

" }}

augroup cursorline_setting
  autocmd!
  autocmd WinEnter,BufEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" Redraw window whenever I've regained focus
augroup redraw_on_refocus
  autocmd!
  autocmd FocusGained * redraw!
augroup END

" key binding for filetype formatter
augroup mapping_vim_filetype_formatter
  autocmd FileType python,rust,terraform
        \ nnoremap <silent> <buffer> <leader>f :FiletypeFormat<cr>
augroup END

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Run black on save a file
autocmd BufWritePost *.py execute ':Black'

" }}}
"
" General: Plugin Install --------------------- {{{

call plug#begin('~/.vim/plugged')

" Jinja highlighting
Plug 'glench/vim-jinja2-syntax'

" Fonts
Plug 'ryanoasis/vim-devicons'

" Git Integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Code prettifier
" Plug 'pappasam/vim-filetype-formatter'

" Commands run in vim's virtual screen and don't pollute main shell
Plug 'fcpg/vim-altscreen'

" Basic coloring
Plug 'NLKNguyen/papercolor-theme'

" Utils
Plug 'tpope/vim-commentary'

" Base vim root with github root
Plug 'airblade/vim-rooter'

" Language-specific syntax
Plug 'hdima/python-syntax'

" Indentation
Plug 'hynek/vim-python-pep8-indent'

" Copy
" Plug 'christoomey/vim-system-copy'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" python code autocompletion
Plug 'davidhalter/jedi-vim'

" Indentation
Plug 'Yggdroot/indentLine'

" TOML
Plug 'cespare/vim-toml'

" Jenkinsfile syntax highlighter
Plug 'martinda/Jenkinsfile-vim-syntax'

" Plug in commands not working
Plug 'scrooloose/nerdtree'

" Linting
Plug 'w0rp/ale'

" Plug for markdown highlighting
Plug 'plasticboy/vim-markdown'

" Plug for spell check
Plug 'kamykn/spelunker.vim'

" svelete
Plug 'evanleck/vim-svelte' "svelte highlights

" fuzzy vim finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Black for python
Plug 'psf/black', { 'branch': 'stable' }

" characters limit for a window
Plug 'junegunn/goyo.vim'

" rust
Plug 'rust-lang/rust.vim'

" copilot
Plug 'github/copilot.vim'

" Prisma
Plug 'pantharshit00/vim-prisma'

" worktree
Plug 'ThePrimeagen/git-worktree.nvim'


" Autocompletion: Conquer of completion----Coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" for coc_plugin in [
"       \ 'neoclide/coc-python',
"       \ 'neoclide/coc-css',
"       \ 'neoclide/coc-html',
"       \ 'neoclide/coc-json',
"       \ 'neoclide/coc-rls',
"       \ 'neoclide/coc-snippets',
"       \ 'neoclide/coc-tsserver',
"       \ 'neoclide/coc-eslint',
"       \ 'neoclide/coc-pairs',
"       \ 'neoclide/coc-yaml',
"       \ 'neoclide/coc-jest',
"       \ 'pantharshit00/coc-prisma',
"       \ ]
"   Plug coc_plugin, { 'do': 'yarn install --frozen-lockfile && yarn build' }
" endfor

" To effectively fold
Plug 'tmhedberg/SimpylFold'

" TSX, typescript highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

Plug 'pappasam/nvim-repl'

Plug 'evanleck/vim-svelte'

Plug 'davidroeca/coc-svelte-language-tools', { 'do': 'yarn install --frozen-lockfile && yarn build' }

Plug 'vim-scripts/groovyindent-unix'

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" }}}

" General: Indentation (tabs, spaces, width, etc)------------- {{{

" augroup indentation_sr
"   autocmd!
"   autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
"   autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
"   autocmd Filetype yaml setlocal indentkeys-=<:>
" augroup END

" }}}
" General: Folding Settings --------------- {{{

augroup fold_settings
  autocmd!
  autocmd FileType vim, tmux, bash, zsh, sh setlocal foldenable  foldmethod=marker foldnestmax=1
  autocmd FileType python setlocal nofoldenable
  " autocmd FileType vim setlocal foldlevelstart=0
  autocmd FileType yaml setlocal nofoldenable foldmethod=indent foldnestmax=1
augroup END

" }}}

" This section should go before syntax highlighting
" because autocommands must be declared before syntax library is loaded
function! s:coc_diagnostic_disable()
  call coc#config('diagnostic.enable', v:false)
  let g:coc_custom_diagnostic_enabled = v:false
  silent CocRestart
  echom 'Disabled: Coc diagnostic'
endfunction


function! s:coc_diagnostic_enable()
  call coc#config('diagnostic.enable', v:true)
  let g:coc_custom_diagnostic_enabled = v:true
  echom 'Enabled: Coc enabled'
endfunction


function! s:coc_diagnostic_toggle()
  if g:coc_custom_diagnostic_enabled == v:true
    call s:coc_diagnostic_disable()
  else
    call s:coc_diagnostic_enable()
  endif
endfunction


function! s:coc_init()
  let g:coc_custom_diagnostic_enabled = v:true
endfunction


" General: Trailing whitespace ------------- {{{
function! s:trim_whitespace()
  let l:save = winsaveview()
  if &ft == 'markdown'
    " Replace lines with only trailing spaces
    %s/^\s\+$//e
    " Replace lines with exactly one trailing space with no trailing spaces
    %g/\S\s$/s/\s$//g
    " Replace lines with more than 2 trailing spaces with 2 trailing spaces
    %s/\s\s\s\+$/  /e
  else
    " Remove all trailing spaces
    %s/\s\+$//e
  endif
  call winrestview(l:save)
endfunction

command! TrimWhitespace call s:trim_whitespace()

augroup custom_fix_whitespace_save
  autocmd!
  autocmd BufWritePre * TrimWhitespace
augroup end

function! TrimWhitespace()
  if &ft == 'markdown'
    return
  endif
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfunction

highlight EOLWS ctermbg=red guibg=red
match EOLWS /\s\+$/
augroup whitespace_color
  autocmd!
  autocmd ColorScheme * highlight EOLWS ctermbg=red guibg=red
  autocmd InsertEnter * highlight EOLWS NONE
  autocmd InsertLeave * highlight EOLWS ctermbg=red guibg=red
augroup END

augroup fix_whitespace_save
  autocmd!
  autocmd BufWritePre * call TrimWhitespace()
augroup END

" }}}

" Utility functions {{{
function! s:warn(message)
  echohl WarningMsg
  echom a:message
  echohl None
  return 0
endfunction

function! s:get_git_root()
  let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
  return v:shell_error ? '' : root
endfunction

function! s:has_git_root()
  let root = s:get_git_root()
  return empty(root) ? 0 : 1
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'help '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

"}}}

" Coc:
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
let g:coc_start_at_startup = 1
let g:coc_filetype_map = {
      \ 'python.jinja2': 'python',
      \ 'sql.jinja2': 'sql',
      \ 'yaml.ansible': 'yaml',
      \ 'yaml.docker-compose': 'yaml',
      \ }

" Coc Global Extensions: automatically installed on Vim open
let g:coc_global_extensions = [
      \ '@yaegassy/coc-nginx',
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-diagnostic',
      \ 'coc-dictionary',
      \ 'coc-docker',
      \ 'coc-emoji',
      \ 'coc-go',
      \ 'coc-html',
      \ 'coc-java',
      \ 'coc-json',
      \ 'coc-lists',
      \ 'coc-markdownlint',
      \ 'coc-rls',
      \ 'coc-sh',
      \ 'coc-snippets',
      \ 'coc-svelte',
      \ 'coc-svg',
      \ 'coc-syntax',
      \ 'coc-texlab',
      \ 'coc-toml',
      \ 'coc-tsserver',
      \ 'coc-vimlsp',
      \ 'coc-word',
      \ 'coc-yaml',
      \ 'coc-yank',
      \ 'coc-pyright',
      \ 'coc-snippets',
      \ ]

function! s:autocmd_custom_coc()
  if !exists("g:did_coc_loaded")
    return
  endif
  augroup custom_coc
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " Coc nvim might override my mappings. I call them again just in case.
    autocmd User CocNvimInit call s:default_key_mappings()
  augroup end
endfunction

augroup custom_coc
  autocmd!
  autocmd VimEnter * call s:autocmd_custom_coc()
  autocmd User CocNvimInit * call s:default_key_mappings()
augroup end

augroup custom_coc_additional_keyword_characters
  autocmd!
  autocmd FileType nginx let b:coc_additional_keywords = ['$']
augroup end


"  Fzf {{{

command! -bang -nargs=* Grep call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --case-sensitive --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* GrepIgnoreCase call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

let g:fzf_action = {
      \ 'ctrl-o': 'edit',
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \ }


function! s:fzf_edit_file(items)
  let items = a:items
  let i = 1
  let ln = len(items)
  while i < ln
    let item = items[i]
    let parts = split(item, ' ')
    let file_path = get(parts, 1, '')
    let items[i] = file_path
    let i += 1
  endwhile
  call s:Sink(items)
endfunction

function! FzfWithDevIcons(command, preview)
  let l:fzf_files_options = ' -m --bind ctrl-n:preview-page-down,ctrl-p:preview-page-up --preview "'.a:preview.'"'
  let opts = fzf#wrap({})
  let opts.source = a:command
  let s:Sink = opts['sink*']
  let opts['sink*'] = function('s:fzf_edit_file')
  let opts.options .= l:fzf_files_options
  call fzf#run(opts)
endfunction

function! FzfFiles()
  let l:fzf_preview = 'bat --color always --style plain {2..}'
  let l:fzf_command = 'rg --files --hidden --follow --glob "!.git/*" | devicon-lookup'
  call FzfWithDevIcons(l:fzf_command, l:fzf_preview)
endfunction

function! FzfGitFiles()
  if !s:has_git_root()
    call s:warn('Not in a git directoy')
    return
  endif

  let l:fzf_preview = 'bat --color always --style plain {2..}'
  " can pipe to uniq because git ls-files returns an ordered list
  let l:fzf_command = 'git ls-files | uniq'
  call FzfWithDevIcons(l:fzf_command, l:fzf_preview)
endfunction

function! FzfDiffFiles()
  if !s:has_git_root()
    call s:warn('Not in a git directoy')
    return
  endif

  let l:fzf_preview = 'bat --color always --style changes {2..}'
  let l:fzf_command = 'git ls-files --modified --others --exclude-standard | uniq'
  call FzfWithDevIcons(l:fzf_command, l:fzf_preview)
endfunction
" }}}

" General: Syntax highlighting ---------------- {{{

" Papercolor: options
let g:PaperColor_Theme_Options = {}
let g:PaperColor_Theme_Options['theme'] = {
      \     'default': {
      \       'transparent_background': 1
      \     }
      \ }
let g:PaperColor_Theme_Options['language'] = {
      \     'python': {
      \       'highlight_builtins' : 1
      \     },
      \     'cpp': {
      \       'highlight_standard_library': 1
      \     },
      \     'c': {
      \       'highlight_builtins' : 1
      \     }
      \ }

" Python: Highlight self and cls keyword in class definitions
augroup python_syntax
  autocmd!
  autocmd FileType python syn keyword pythonBuiltinObj self
  autocmd FileType python syn keyword pythonBuiltinObj cls
augroup end

" Syntax: select global syntax scheme
" Make sure this is at end of section
try
  set t_Co=256 " says terminal has 256 colors
  set background=dark
  colorscheme PaperColor
catch
endtry

" }}}
"  Plugin: Configure ------------ {{{

" Direct neovim to asdf managed python provider
let g:python3_host_prog = "$HOME/.asdf/shims/python"
let g:loaded_python_provider = 0

" Python highlighting
let g:python_highlight_space_errors = 0
let g:python_highlight_all = 1

let g:black_virtualenv = '/home/anshu/.venv'
let g:black_linelength = 80
"  NERDTree --- {{{

let g:NERDTreeMapOpenInTab = '<C-t>'
let g:NERDTreeMapOpenInTabSilent = ''
let g:NERDTreeMapOpenSplit = '<C-s>'
let g:NERDTreeMapOpenVSplit = '<C-v>'
let g:NERDTreeMapJumpNextSibling = '<C-n>'
let g:NERDTreeMapJumpPrevSibling = '<C-p>'
let g:NERDTreeMapJumpFirstChild = '<C-k>'
let g:NERDTreeMapJumpLastChild = '<C-j>'

let g:NERDTreeShowLineNumbers = 1
let g:NERDTreeCaseSensitiveSort = 0
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 31
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeSortOrder = ['*', '\/$']
let g:NERDTreeIgnore=[
      \'venv$[[dir]]',
      \'.venv$[[dir]]',
      \'__pycache__$[[dir]]',
      \'.egg-info$[[dir]]',
      \'node_modules$[[dir]]',
      \'elm-stuff$[[dir]]',
      \'\.aux$[[file]]',
      \'\.toc$[[file]]',
      \'\.pdf$[[file]]',
      \'\.out$[[file]]',
      \'\.o$[[file]]',
      \]

function! s:default_key_mappings()
  " Coc: settings for coc.nvim
  nmap     <silent>        <leader>g <Plug>(coc-definition)
  nmap     <silent>        <C-LeftMouse> <Plug>(coc-definition)
  nnoremap <silent>        <C-K> <cmd>call <SID>show_documentation()<CR>
  nnoremap <silent>        <C-h> <cmd>call CocActionAsync('showSignatureHelp')<CR>
  inoremap <silent>        <C-h> <cmd>call CocActionAsync('showSignatureHelp')<CR>
  nmap     <silent>        <leader>st <Plug>(coc-type-definition)
  nmap     <silent>        <leader>si <Plug>(coc-implementation)
  nmap     <silent>        <leader>su <Plug>(coc-references)
  nmap     <silent>        <leader>sr <Plug>(coc-rename)
  xmap     <silent>        if <Plug>(coc-funcobj-i)
  xmap     <silent>        af <Plug>(coc-funcobj-a)
  omap     <silent>        if <Plug>(coc-funcobj-i)
  omap     <silent>        af <Plug>(coc-funcobj-a)
  xmap     <silent>        ic <Plug>(coc-classobj-i)
  xmap     <silent>        ac <Plug>(coc-classobj-a)
  omap     <silent>        ic <Plug>(coc-classobj-i)
  omap     <silent>        ac <Plug>(coc-classobj-a)
  nnoremap <silent>        <leader>sn <cmd>CocNext<CR>
  nnoremap <silent>        <leader>sp <cmd>CocPrev<CR>
  nnoremap <silent>        <leader>sl <cmd>CocListResume<CR>
  nnoremap <silent>        <leader>sc <cmd>CocList commands<cr>
  nnoremap <silent>        <leader>so <cmd>CocList -A outline<cr>
  nnoremap <silent>        <leader>sw <cmd>CocList -A -I symbols<cr>
  inoremap <silent> <expr> <c-space> coc#refresh()
  nnoremap <silent> <expr> <C-e> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-e>"
  nnoremap <silent> <expr> <C-y> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-y>"
  imap     <silent>        <C-l> <Plug>(coc-snippets-expand)
  imap     <silent> <expr> <C-l> coc#expandable() ? "<Plug>(coc-snippets-expand)" : "\<C-y>"
  inoremap <silent> <expr> <CR> pumvisible() ? '<CR>' : '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
  nnoremap <silent>        <leader>a <cmd>CocDiagnosticToggle<CR>
  nmap     <silent>        <leader>n <Plug>(coc-diagnostic-next)
  nmap     <silent>        <leader>p <Plug>(coc-diagnostic-prev)

  " Auto execute all filetypes
  let &filetype=&filetype
endfunction

call s:default_key_mappings()


function! NERDTreeToggleCustom()
  if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    " if NERDTree is open in window in current tab...
    exec 'NERDTreeClose'
  else
    exec 'NERDTree %'
  endif
endfunction

function! s:CloseIfOnlyControlWinLeft()
  if winnr("$") != 1
    return
  endif
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
        \ || &buftype == 'quickfix'
    q
  endif
endfunction

augroup CloseIfOnlyControlWinLeft
  au!
  au BufEnter * call s:CloseIfOnlyControlWinLeft()
augroup END


" Key Remappings:
nnoremap <silent> <space>j :NERDTreeToggle<CR>
nnoremap <silent> <space>J :call NERDTreeToggleCustom()<CR>
nnoremap <silent> <space>k :NERDTreeFind<cr>

  " coc settings
  nnoremap <silent> <C-K> :call <SID>show_documentation()<CR>
  nnoremap <silent> <leader>a :CocDiagnosticToggle<CR>
  nmap <silent> <C-]> <Plug>(coc-definition)
  nmap <silent> <Leader>st <Plug>(coc-type-definition)
  nmap <silent> <Leader>si <Plug>(coc-implementation)
  nmap <silent> <Leader>su <Plug>(coc-references)
  nmap <silent> <Leader>sr <Plug>(coc-rename)
  " Next and previous items in list
  nnoremap <silent> <Leader>sn :<C-u>CocNext<CR>
  nnoremap <silent> <Leader>sp :<C-u>CocPrev<CR>
  nnoremap <silent> <Leader>sl :<C-u>CocListResume<CR>
  " Show commands
  nnoremap <silent> <Leader>sc :<C-u>CocList commands<CR>
  " Find symbol in current document
  nnoremap <silent> <Leader>ss :<C-u>CocList outline<CR>
  " Search workspace symbols
  nnoremap <silent> <Leader>sw :<C-u>CocList -I symbols<CR>

  " Use <c-space> to trigger completion
  inoremap <silent><expr> <c-space> coc#refresh()

  " Scroll in floating window
  nnoremap <expr><C-d> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-d>"
  nnoremap <expr><C-u> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-u>"

  command! CocDiagnosticToggle call s:coc_diagnostic_toggle()
"  }}}
"  Vim Ale --- {{{

" Vim Ale:
"Limit linters used for JavaScript.
let g:ale_linters = {
      \   'javascript': ['eslint', 'flow'],
      \   'python': ['pylint', 'mypy']
      \}
" highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
" highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X'
let g:ale_sign_warning = '?'
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" turn off ale on open, turn on with Toggle
let g:ale_enabled = 0
" only run on save
" let g:ale_lint_on_text_changed = 'never' -- not using currently, because
" we can toggle ALE on and off with space at
" Map keys to navigate between lines with errors and warnings.

augroup mapping_ale_fix
  autocmd FileType python,javascript,javascript.jsx,
        \ nnoremap  <space>ap :ALEPreviousWrap<cr> |
        \ nnoremap  <space>an :ALENextWrap<cr> |
        \ nnoremap  <space>at :ALEToggle<cr>
augroup END
" }}}

"  Vim Filetype Formatter --- {{{

" " code formatting, thanks sam
let g:vim_filetype_formatter_commands = {
      \ 'python': 'black - -q --line-length 79',
      \ 'javascript': 'npx -q prettier --parser flow --stdin',
      \ 'javascript.jsx': 'npx -q prettier --parser flow --stdin',
      \ 'css': 'npx -q prettier --parser css --stdin',
      \ 'less': 'npx -q prettier --parser less --stdin',
      \ 'html': 'npx -q prettier --parser html --stdin',
      \ 'vue': 'npx -q prettier --html-whitespace-sensitivity ignore --parser vue --stdin'
      \}

nnoremap <leader>f :FiletypeFormat<cr>
vnoremap <leader>f :FiletypeFormat<cr>

" }}}

" AutoPairs --- {{{
" AutoPairs:
" unmap CR due to incompatibility with clang-complete
let g:AutoPairsMapCR = 0
let g:AutoPairs = {
      \ '(':')',
      \ '[':']',
      \ '{':'}',
      \ "'":"'",
      \ '"':'"',
      \ '`':'`'
      \ }
augroup autopairs_filetype_overrides
   autocmd FileType python let b:AutoPairs = {
      \ '(':')',
      \ '[':']',
      \ '{':'}',
      \ "'":"'",
      \ '"':'"',
      \ '`':'`',
      \ '"""': '"""',
      \ "'''": "'''",
      \ }
  autocmd FileType rust let b:AutoPairs = {
        \ '(':')',
        \ '[':']',
        \ '{':'}',
        \ '"':'"',
        \ '`':'`'
        \ }
   autocmd FileType markdown let b:AutoPairs = {
        \ '(':')',
        \ '[':']',
        \ '{':'}',
        \ "'":"'",
        \ '"':'"',
        \ '`':'`',
        \ '"""': '"""',
        \ "'''": "'''",
        \ '```': '```',
        \ }
  autocmd FileType plantuml let b:AutoPairs = {
        \ '{':'}',
        \ '"':'"',
        \ '`':'`'
        \ }
  autocmd FileType tex let b:AutoPairs = {
        \ '(':')',
        \ '[':']',
        \ '{':'}',
        \ '`': "'"
        \ }
  autocmd FileType vim let b:AutoPairs = {
        \ '(':')',
        \ '[':']',
        \ '{':'}',
        \ "'":"'",
        \ '`':'`',
        \ }
augroup END

" Key Remappings:
imap <silent><CR> <CR><Plug>AutoPairsReturn

"  }}}


" Deoplete {{{
" let g:deoplete#enable_at_startup = 1
" function! CustomDeopleteConfig()
"   " Deoplete Defaults:
"   call deoplete#custom#option({
"         \ 'auto_complete': v:true,
"         \ 'auto_complete_delay': 300,
"         \ 'max_list': 500,
"         \ 'num_processes': 2,
"         \ })

"   " Source Defaults:
"   call deoplete#custom#option('ignore_sources', {'_': ['buffer', 'around']})
"   call deoplete#custom#source('_', 'min_pattern_length', 1)
"   call deoplete#custom#source('_', 'converters', ['converter_remove_paren'])
" endfunction
" augroup deoplete_on_vim_startup
"   autocmd!
"   autocmd VimEnter * call CustomDeopleteConfig()
" augroup END
" " }}}

" LSP LanguageClient: add new language server here
" let g:LanguageClient_serverCommands = {
"       \ 'haskell': ['stack', 'exec', 'hie-wrapper'],
"       \ 'javascript': ['npx', '-q', 'flow', 'lsp'],
"       \ 'javascript.jsx': ['npx', 'flow', 'lsp'],
"       \ 'python': ['jedi-language-server'],
"       \ 'python.jinja2': ['jedi-language-server'],
"       \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
"       \ 'ruby': ['solargraph', 'stdio'],
"       \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
"       \ 'typescript': ['npx', '-q', 'typescript-language-server', '--stdio'],
"        }

" " Language server configuration here
" let g:LanguageClient_autoStart = v:true
" let g:LanguageClient_hoverPreview = 'auto'
" let g:LanguageClient_diagnosticsEnable = v:false
" let g:LanguageClient_selectionUI = 'quickfix'
" function! CustomLanguageClientConfig()
"   nnoremap <buffer> <C-]> :call LanguageClient#textDocument_definition()<CR>
"   nnoremap <buffer> <leader>sd :call LanguageClient#textDocument_hover()<CR>
"   nnoremap <buffer> <leader>sr :call LanguageClient#textDocument_rename()<CR>
"   nnoremap <buffer> <leader>sf :call LanguageClient#textDocument_formatting()<CR>
"   nnoremap <buffer> <leader>su :call LanguageClient#textDocument_references()<CR>
"   nnoremap <buffer> <leader>sa :call LanguageClient#textDocument_codeAction()<CR>
"   nnoremap <buffer> <leader>ss :call LanguageClient#textDocument_documentSymbol()<CR>
"   nnoremap <buffer> <leader>sc :call LanguageClient_contextMenu()<CR>
"   setlocal omnifunc=LanguageClient#complete
" endfunction
" augroup languageclient_on_vim_startup
"   autocmd!
"   execute 'autocmd FileType '
"         \ . join(keys(g:LanguageClient_serverCommands), ',')
"         \ . ' call CustomLanguageClientConfig()'
" augroup END

"  }}}
" General: Key remappings ----------------------- {{{

" Put your key remappings here
" Prefer nnoremap to nmap, inoremap to imap, and vnoremap to vmap
function! DefaultKeyMappings()
  nnoremap <C-p> :call FzfFiles()<CR>
  nnoremap <C-g> :call FzfGitFiles()<CR>
  nnoremap <C-d> :call FzfDiffFiles()<CR>
  nnoremap <leader>f :FiletypeFormat<cr>
  vnoremap <leader>f :FiletypeFormat<cr>
  noremap jk <esc>

  "clipboard copy paste
  vnoremap <leader>y "+y
  nnoremap <leader>p "+p

  " newline, if no, start paste on the current line
  nnoremap <expr> <leader>p
      \ len(getline('.')) == 0 ? '"+p"' : 'o<esc>"+p"'
  nnoremap <silent> <esc> :noh<return><esc>
  nnoremap <silent> <expr> J v:count == 0 ? '<esc>' : 'J'
endfunction
call DefaultKeyMappings()
" }}}
"
augroup custom_indentation
  autocmd!
  autocmd Filetype * setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=8
  autocmd Filetype python setlocal shiftwidth=4 softtabstop=4 tabstop=8
  autocmd Filetype yaml setlocal indentkeys-=<:>
  autocmd Filetype dot :setlocal autoindent cindent
  autocmd Filetype make,tsv,votl
        \ setlocal tabstop=4 softtabstop=0 shiftwidth=4 noexpandtab
augroup END

" Shorthand for adding email-id
iabbrev @@ atomar@kepler.com
iabbrev ccopy Copyright 2019 Kepler Group, all rights reserverd.

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" General: Cleanup ------------------ {{{
" commands that need to run at the end of my vimrc

" disable unsafe commands in your project-specific .vimrc files
" This will prevent :autocmd, shell and write commands from being
" run inside project-specific .vimrc files unless they’re owned by you.
set secure

" ShowCommand: turn off character printing to vim status line
set noshowcmd

" }}}
