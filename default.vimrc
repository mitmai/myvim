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

let mapleader = ","
" Auto-complete using Ctrl+K.
"set dictionary-=~/.vim/funclist.txt
"set complete-=k complete+=k
filetype plugin on
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType css setl ofu=csscomplete#CompleteCSS
au FileType js setl ofu=javascriptcomplete#CompleteJS


" Syntax highlight.
syntax on
"hi Comment term=standout cterm=bold ctermfg=0
"highlight Search term=reverse ctermbg=3 ctermfg=0
"highlight Normal ctermbg=black ctermfg=white
"highlight Folded ctermbg=black ctermfg=darkcyan
"hi Cursor ctermbg=Gray ctermfg=Blue
"highlight clear SpellBad
"highlight SpellBad term=underline cterm=underline ctermfg=red
"hi PmenuSel guifg=#c0c0c0 guibg=#2050d0 ctermfg=blue ctermbg=fg cterm=reverse

" Always use utf-8 encoding.
set fileencoding=utf-8
set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
set encoding=utf8
set termencoding=utf8

" Set foldering.
set foldmethod=syntax
set foldnestmax=2

" Set tab settings.
highlight TabLine ctermbg=blue
highlight TabLineFill ctermbg=green
highlight TabLineSel ctermbg=red

" Set F1-F12 shortcut keys.
map <silent> <Leader>f :NERDTree<CR>
map <silent> <Leader>l :TagbarToggle<CR>
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
let g:tagbar_iconchars = ['+', '-']
nnoremap <leader>l :TagbarToggle<CR>

" PHP Documentation plugin.
"inoremap <C-K> <ESC>:call PhpDocSingle()<CR>i
"nnoremap <C-K> :call PhpDocSingle()<CR>
"vnoremap <C-K> :call PhpDocRange()<CR>
"

let g:UltiSnipsSnippetsDir = "~/.vim/bundle/UltiSnips/UltiSnips"
" Command-T plugin.
let g:CommandTMaxHeight = 15
noremap <Leader>t :CommandT<CR>
noremap <Leader>m :CommandTBuffer<CR>

" SuperTab plugin.
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabDefaultCompletionType = "context""

" NERDTree
let NERDTreeDirArrows=0

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" CtrlP, disalbe c-p to avoid conflict
let g:ctrlp_map = ''
noremap <Leader>p :CtrlP<CR>
noremap <Leader>e :CtrlP<CR>
let g:ctrlp_working_path_mode = 'a'

" MiniBufExpl
map <c-n> :MBEbn <CR>
map <c-p> :MBEbp <CR>
let g:miniBufExplorerMoreThanOne = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplCheckDupeBufs = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplForceSyntaxEnable = 1


" DoxygenToolKit
"let g:DoxygenToolkit_commentType = "C++"
let g:DoxygenToolkit_briefTag_pre="@Brief "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns "
let g:DoxygenToolkit_authorName="Tim Hsieh"
let g:DoxygenToolkit_licenseTag=                            " \<enter>Copyright (c) 2013, Three Ocean (to@bcloud.us). All rights reserved.         "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>Redistribution and use in source and binary forms, with or without           "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>modification, are permitted provided that the following conditions are met:  "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>    * Redistributions of source code must retain the above copyright         "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>      notice, this list of conditions and the following disclaimer.          "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>    * Redistributions in binary form must reproduce the above copyright      "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>      notice, this list of conditions and the following disclaimer in the    "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>      documentation and/or other materials provided with the distribution.   "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>    * Neither the name of the <organization> nor the                         "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>      names of its contributors may be used to endorse or promote products   "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>      derived from this software without specific prior written permission.  "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>                                                                             "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS \"AS IS\""
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE    "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE   "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>ARE DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY       "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES   "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND  "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT   "
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS"
let g:DoxygenToolkit_licenseTag=DoxygenToolkit_licenseTag . " \<enter>SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                 "


"The BSD 3-Clause License
map 3<Leader>h :so ~/.vim/template/bsd3lic.txt<CR>
map 1<Leader>h :so ~/.vim/template/gplic.txt<CR>

" color scheme
"colorscheme putty
colorscheme mycolor

" Set status line.
set ls=2
set statusline=%<%f\ %m%=\ %h%r\ %-19([%p%%]\ %3l,%02c%03V%)%y
highlight StatusLine term=bold,reverse cterm=bold,reverse

" Set cursor line.
set cursorline
highlight CursorLine cterm=bold ctermbg=blue
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


let myvim=$HOME."/.vimrc_".$USER
if filereadable(myvim)
  :so $HOME/.vimrc_$USER
endif

" Hotkey
noremap <Leader>w :wqa!<CR>
noremap <Leader>q :qa!<CR>

" ctags
map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R *<CR><CR>

" Search path
"set path=**

highlight MBEChanged ctermbg=gray ctermfg=red
highlight MBENormal ctermbg=gray ctermfg=white
highlight MBEVisibleActiveNormal ctermbg=gray ctermfg=green
highlight MBEVisibleChanged ctermbg=gray ctermfg=red
highlight MBEVisibleNormal ctermbg=gray ctermbg=green
highlight MBEVisibleActiveChanged ctermbg=gray ctermfg=yellow
