execute pathogen#infect()

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

syntax enable
set background=light
let g:solarized_termcolors=256
colorscheme solarized

"switch between splits using Ctrl+hjkl
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"display NERTDTree using Ctrl+n
map <C-n> :NERDTreeToggle<CR>
