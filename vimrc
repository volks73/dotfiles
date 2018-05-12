execute pathogen#infect()
cd ~/Desktop
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
set number
set nolist
set formatoptions+=1
set lbr
set mouse=c
set anti enc=utf-8
set expandtab
set tabstop=4
set shiftwidth=4
set background=dark
set ruler
set autochdir
set backupdir-=.
set backupdir+=/tmp//
set dir=/tmp//
set showcmd
syntax on
inoremap fd <Esc>
nnoremap <SPACE> <Nop>
vnoremap <SPACE> <Nop>
map <SPACE> <Leader>
"nmap <Leader>a= :Tabularize /=<CR>
"vmap <Leader>a= :Tabularize /=<CR>
"nmap <Leader>a: :Tabularize /:\zs<CR>
"vmap <Leader>a: :Tabularize /:\zs<CR>
"nmap <Leader>a\| :Tabularize /\|<CR>
"vmap <Leader>a\| :Tabularize /\|<CR>
nnoremap n nzz
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <D-d> <C-d>
nnoremap <D-u> <C-u>
vnoremap <D-d> <C-d>
vnoremap <D-u> <C-u>
nnoremap <D-j> <C-W><C-j>
nnoremap <D-k> <C-W><C-k>
nnoremap <D-l> <C-W><C-l>
nnoremap <D-h> <C-W><C-h>
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
nmap <Leader>ne :NERDTreeToggle<CR>
nmap <Leader>p "+p
vmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>P "+P
nmap <Leader>y "+y
vmap <Leader>y "+y
let g:solarized_termtrans=1
let g:solarized_termcolors=256
colorscheme solarized 
filetype indent plugin on
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd Filetype svn setlocal spell textwidth=72
autocmd Filetype markdown setlocal spell
autocmd Filetype markdown.pandoc setlocal spell conceallevel=0
augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc spell conceallevel=0
augroup END
autocmd BufRead,BufNewFile *.csv set nowrap
autocmd BufRead,BufNewFile *.lcm set filetype=dosini
autocmd BufRead,BufNewFile *.lcw set filetype=dosini
autocmd BufRead,BufNewFile *.lca set filetype=lua
autocmd BufRead,BufNewFile *.ino set filetype=arduino
autocmd BufRead,BufNewFile *.pde set filetype=arduino
autocmd BufRead,BufNewFile *.ulp set filetype=c
