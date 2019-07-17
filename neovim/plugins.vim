call plug#begin('~/.config/nvim/plugged')

" ===== Editing Plugins =====

" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Intellisense engine (language server support)
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Auto-close plugin
Plug 'rstacruz/vim-closer'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim', { 'commit': '29bfd4c53271c7a150def2388e059746ae4c1713' }


" ===== Haskell =====

" Improved syntax highlighting and indentation
Plug 'neovimhaskell/haskell-vim'


" ===== JavaScript =====

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'


" ===== TypeScript =====

" Improved syntax highlighting and indentation
Plug 'HerringtonDarkholme/yats.vim'


" ===== Color Schemes =====

Plug 'icymind/neosolarized'
Plug 'dkasak/gruvbox'
Plug 'mhartington/oceanic-next'


" ===== Utilities =====

" File explorer
Plug 'scrooloose/nerdtree'

" Rainbow Parentheses
Plug 'luochen1990/rainbow'

" Add file type glyphs/icons to popular Vim plugins: NERDTree, vim-airline, etc
Plug 'ryanoasis/vim-devicons'

" Extra syntax and highlight for nerdtree files
Plug 'vwxyutarooo/nerdtree-devicons-syntax'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


call plug#end()
