"
" Copyright (c) 2013, Tim Hsieh (mitmai@gmail.com) All rights reserved.
"
" Redistribution and use in source and binary forms, with or without
" modification, are permitted provided that the following conditions are met:
"     * Redistributions of source code must retain the above copyright
"       notice, this list of conditions and the following disclaimer.
"     * Redistributions in binary form must reproduce the above copyright
"       notice, this list of conditions and the following disclaimer in the
"       documentation and/or other materials provided with the distribution.
"     * Neither the name of the <organization> nor the
"       names of its contributors may be used to endorse or promote products
"       derived from this software without specific prior written permission.
"
" THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
" IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
" ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
" DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
" (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
" LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
" ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
" (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
" SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
"

" color scheme
colorscheme darkblue

filetype on
if &diff
    filetype plugin off
else
    filetype plugin on
endif

set bs=2
set cindent
set history=50
"set nomodeline
"set nowrap
set number
set runtimepath=~/.vim,$VIMRUNTIME
set title
set wildmenu

" Highlight search keywords.
set hlsearch
set incsearch

" Replace tab with 2 spaces.
set expandtab
set shiftwidth=2
set tabstop=2

" Auto-complete using Ctrl+K.
set dictionary-=~/.vim/funclist.txt
set complete-=k complete+=k

" Syntax highlight.
syntax on
"hi Comment term=standout cterm=bold ctermfg=0
"highlight Search term=reverse ctermbg=3 ctermfg=0
"highlight Normal ctermbg=black ctermfg=white
"highlight Folded ctermbg=black ctermfg=darkcyan
"hi Cursor ctermbg=Gray ctermfg=Blue
"highlight clear SpellBad
"highlight SpellBad term=underline cterm=underline ctermfg=red


" Set status line.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine term=bold,reverse cterm=bold,reverse

" Set cursor line.
set cursorline
highlight CursorLine cterm=bold ctermbg=blue
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Always use utf-8 encoding.
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set encoding=utf8
set tenc=utf8

" Set foldering.
set foldmethod=syntax
set foldnestmax=2

" Set tab settings.
highlight TabLine ctermbg=blue
highlight TabLineFill ctermbg=green
highlight TabLineSel ctermbg=red

" Set F1-F12 shortcut keys.
map <silent> d :NERDTree<CR>
map <silent> m :TagbarToggle<CR>
map <buffer><silent> <F5> :w<CR>:make <CR>:cw

" Activate pathogen.vim
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()

" Removing tailing spaces.
au! BufWrite * mark ' | silent! %s/\s\+$// | norm ''
" Replace tab to spaces.
au BufWrite * :retab

" Set auto commands.
autocmd BufReadPost *
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\   exe "normal g'\"" |
\ endif

" Make vim setting works immediately.
autocmd! BufWritePost .vimrc source %

" Create a template file.
autocmd BufNewFile *.html so ~/.vim/template/html.txt
"autocmd BufNewFile *.html exe "1," . 10 . "g/name=\"created\" content=\".*\"/s//name=\"created\" content=\"" .strftime("%Y-%m-%d"). "\""
"autocmd BufWritePre,FileWritePre *.html exe "1," . 10 . "g/name=\"modified\" content=\".*\"/s//name=\"modified\" content=\"" .strftime("%c"). "\""

" C/C++ template file
autocmd BufNewFile *.h so ~/.vim/template/cheader.txt
autocmd BufNewFile *.h exe "1," . 10 . "g/_author_ (_email_)/s//Three Ocean (to@bcloud.us)"


" Tagbar plugin.
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_width = 30

" PHP Documentation plugin.
"inoremap <C-K> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-K> :call PhpDocSingle()<CR>
"vnoremap <C-K> :call PhpDocRange()<CR>

" Command-T plugin.
let g:CommandTMaxHeight = 15
map t :CommandT<CR>

" SuperTab plugin.
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" MiniBufExpl
map <C-N> :MBEbn <CR>
map <C-P> :MBEbp <CR>

"The BSD 3-Clause License
map 3<Leader>h :so ~/.vim/template/bsd3lic.txt
