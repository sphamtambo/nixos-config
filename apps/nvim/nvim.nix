{ config, pkgs, ... }:
programs.neovim = {
      enable = true;
      extraConfig = ''
        " Show matching"
        set showmatch

        " Save undo history even after closing the file"
        set undofile

        " Set history save"
        set history=10000

        " Use Linux system clipboard"
        set clipboard+=unnamedplus
        set clipboard+=unnamed

        " Mouse"
        set mouse=a

        " Line numbers"
        set relativenumber
        set number

        " Scroll"
        set scrolloff=8
        set signcolumn=yes
        set isfname+=@-@

        " Don't redraw while executing macros"
        set lazyredraw

        " Tabs and indentation"
        set tabstop=4
        set softtabstop=4
        set shiftwidth=4
        set autoindent

        " Line wrapping"
        set wrap
        set textwidth=79
        set colorcolumn=80

        " Display file info"
        " set title

        " Search settings"
        set ignorecase
        set smartcase
        set hlsearch
        set incsearch

        " Cursor line"
        set cursorline

        " Appearance"
        set termguicolors
        set background=dark

        " Backspace"
        set backspace=indent,eol,start

        " Split windows"
        set splitright
        set splitbelow

        " Delete word"
        set iskeyword-_

        " Fat cursor"
        set guicursor

        " Fast update time"
        set updatetime=50

	" Set leader key to space"
        let g:mapleader = " "
        
        " General Keymaps"
        " use ii to exit insert mode"
        inoremap ii <Esc>
        
        " insert mode movements"
        inoremap <C-h> <Left>
        inoremap <C-j> <Down>
        inoremap <C-k> <Up>
        inoremap <C-l> <Right>
        
        " move highlighted text"
        vnoremap J :m '>+1<CR>gv=gv
        vnoremap K :m '<-2<CR>gv=gv
        
        " clear search highlights"
        nnoremap <leader><space> :nohl<CR>
        
        " dont copy highlighted text to clipboard when pasting"
        vnoremap p "_dP
        
        " stay in indent mode"
        vnoremap < <gv
        vnoremap > >gv
        
        " date"
        nnoremap <leader>t i<C-r>=strftime('%Y-%m-%d %a %I:%M %p')<CR><Esc>
        
        " press * to search for term under cursor in normal mode selection"
        " and then press a key below to replace all instances of it the current file"
        nnoremap <leader>r :%s///g<Left><Left>
        nnoremap <leader>rc :%s///gc<Left><Left><Left>
        
        " press * to search for term under cursor visual mode selection"
        " and then press a key below to replace all instances of it the current file"
        vnoremap <leader>r :s///g<Left><Left>
        vnoremap <leader>rc :s///gc<Left><Left><Left>
        
        " delete single character without copying into register"
        nnoremap x "_x
        
        " increment/decrement numbers"
        nnoremap <leader>+ <C-a>
        nnoremap <leader>- <C-x>
        
        " window management"
        nnoremap <leader>sv <C-w>v
        nnoremap <leader>sh <C-w>s
        nnoremap <leader>se <C-w>=
        nnoremap <leader>sx :close<CR>
        
        " tab management"
        nnoremap <leader>to :tabnew<CR>
        nnoremap <leader>tx :tabclose<CR>
        nnoremap <leader>tn :tabn<CR>
        nnoremap <leader>tp :tabp<CR>
        nnoremap <leader>tm :tabedit %<CR>
      '';
    };
  };
}

