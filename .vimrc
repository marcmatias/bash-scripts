set encoding=utf-8
syntax enable

" Show numbers
set number
" Show searchs
set incsearch
" Automatic indent
set autoindent

set expandtab
set softtabstop=2
set shiftwidth=2

set autoindent
" set textwidth=80

autocmd FileType markdown setlocal spell spelllang=en_us,pt_br
autocmd FileType markdown set tabstop=2

" Treat all .md files as markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Setting a theme
colorscheme ayu

" Set more variable colors
set termguicolors

" Force background transparent in personalized themes
hi Normal guibg=NONE ctermbg=NONE

" Highlight white spaces
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$/

" Autocomplete
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/marcmatias/.vimundo/

" Powerline config
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Minibar showing actual file
set laststatus=2

" Plugins
call plug#begin()

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

