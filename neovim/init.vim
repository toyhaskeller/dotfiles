scriptencoding utf-8
source ~/.config/nvim/plugins.vim

syntax on
filetype plugin indent on

" Remap leader key to ,
let g:mapleader=','

" Edit neovim configuration
nnoremap <Leader>fed :e ~/.config/nvim/init.vim<CR>
" Reload neovim configuration
nnoremap <Leader>fer :so ~/.config/nvim/init.vim<CR>

" Show absolute line numbers
set number

" Enable relative line numbers
set relativenumber

" Move the cursor to the matched string, while typing the search pattern
set incsearch

" Highlight all search pattern matches
set hlsearch

" Ignore case when searching
set ignorecase

" If the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Make the new window appear below the current window (default is above)
set splitbelow

" Make the new window appear on the right (default is left)
set splitright

" Insert spaces when TAB is pressed.
set expandtab

" Indentation amount for < and > commands.
set shiftwidth=4

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=4

" Do not wrap long lines by default
set nowrap

" Highlight current cursor line
set cursorline

" Highlight current cursor column
set cursorcolumn

" Hides buffers instead of closing them
set hidden

" Automatically re-read file if a change was detected outside of vim
set autoread

" Automatically save when changing between buffers
set autowrite

" Do not fold your code by default on initial load of a file
set nofoldenable

" Yank and paste with the system clipboard
set clipboard^=unnamed,unnamedplus

" Toggle cursorline when entering and leaving insert mode
au InsertEnter * set nocursorline
au InsertLeave * set cursorline

" Why would terminals want line numbers???
au TermOpen * setlocal nonumber norelativenumber

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile


" Enable true color support
set termguicolors

" Editor theme
set background=dark

" Change vertical split character to be a space (essentially hide it)
" set fillchars+=vert:.
"
" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=1

" Clear highlighted search terms while preserving history
nmap <silent> <leader>/ :nohlsearch<CR>

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2' or 'The only match'
set shortmess+=c

" Noop the arrow keys in normal mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
noremap <PageUp> <nop>
noremap <PageDown> <nop>

" Pane/split management
nnoremap <Leader>v :vsplit<CR>
nnoremap <Leader>s :split<CR>

" Easy split navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

try
  colorscheme OceanicNext
catch
  colorscheme gruvbox
endtry


" ===== NERDTree =====

map <Leader>nt :NERDTreeToggle<Bar>wincmd p<CR>
map <Leader>nf :NERDTreeFind<Bar>wincmd p<CR>

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '↳'
let g:NERDTreeDirArrowCollapsible = '↧'

" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]']

" Quit neovim if NERDTree is the only window remaining
autocmd! BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ===== Rainbow Parentheses =====

" Enable parentheses highlighting
let g:rainbow_active=1


" ===== vim-better-whitespace ===== "

" Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>


" ===== neosolarized =====

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1


" ===== gruvbox =====

let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1


" ===== Vim Airline =====

" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warning section to use coc.nvim
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '❮'
let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

" Vim Airline theme
let g:airline_theme='space'

" ===== Denite =====

" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Open file commands
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

call denite#custom#map('insert', 'j', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', 'k', '<denite:move_to_previous_line>', 'noremap')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)

"   <leader>fb - Browser currently open buffers
"   <leader>ff - Browse list of files in current directory
"   <leader>fs - Search current directory for occurences of given term and close window if no results
"   <leader>fw - Search current directory for occurences of word under cursor
nnoremap <leader>fb :Denite buffer -split=floating -winrow=1<CR>
nnoremap <leader>ff :Denite file/rec -split=floating -winrow=1<CR>
nnoremap <leader>fs :<C-u>Denite grep:. -no-empty<CR>
nnoremap <leader>fw :<C-u>DeniteCursorWord grep:.<CR>


" ===== CoC (language server support) =====

au BufRead,BufNewFile *.sbt set filetype=scala

" Color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type
"
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif
