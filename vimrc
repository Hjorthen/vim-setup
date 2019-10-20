let mapleader="½"
let maplocalleader=","
set nu
set et
set ts=4 " tabspaces        ctrl-t ctrl-d
set sw=4 " shiftwidth       visual < >
set nocompatible
set enc=utf-8
set noswapfile
set tags=.tags
set smartcase

nnoremap <F2> :grep! <cword> -r .<cr>
nnoremap <leader>f :grep! <cword> -r "%:h"<cr>
nnoremap <F9> :make!<cr>
vnoremap <leader>c :w !xclip -selection clipboard<cr><cr>

" set AnsiEsc

filetype off
set rtp+=~/.vim/bundle/Vundle.vim



call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'kien/ctrlp.vim' " Fuzzy search for C++
Plugin 'lervag/vimtex'
Plugin 'w0rp/ale' " Linting
Plugin 'stefandtw/quickfix-reflector.vim' " Make and apply changes in the quickfix window
Plugin 'OmniSharp/omnisharp-vim' " Auto complete for C#
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dkarter/bullets.vim' " Adds bullet lists in markdown
Plugin 'SirVer/ultisnips' " Snippet Engine
Plugin 'honza/vim-snippets' " Actual snippets
Plugin 'vim-airline/vim-airline' " Pretty
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()            " required

let g:ctrlp_by_filename=1
let g:ctrlp_custom_ignore='(\.(git|)|thirdparty).*'

filetype plugin indent on
syntax on
set backspace=indent,eol,start
filetype plugin indent on
set completeopt=longest,menuone,preview

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\\/.'
                    let file = substitute(file, '.*\\/\\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Set theme 
autocmd vimenter * :AirlineTheme tomorrow

" Autocomplete in vim  Ctrl + p/n 
" Spellcheck z=  
" Color
colorscheme deus
