call plug#begin("~/.vim/plugged")
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'inkarkat/vim-visualrepeat'
    Plug 'yuttie/comfortable-motion.vim'
    " Plug 'arcticicestudio/nord-vim'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    "Plug 'pangloss/vim-javascript'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'inkarkat/vim-CountJump'
    Plug 'inkarkat/vim-ingo-library'
    "Plug 'w0rp/ale'
    Plug 'kana/vim-textobj-user'
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'haishanh/night-owl.vim'
    Plug 'mileszs/ack.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'honza/vim-snippets'
    Plug 'scrooloose/nerdTree'
    Plug 'ctrlpvim/ctrlp.vim'
   " Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/echodoc.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'

call plug#end()


imap <C-v> <C-O>"+p

vnoremap <C-c> "+y

vnoremap <C-x> "+d



"session config
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0

""""" enable 24bit true color
"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1


" List occurrences for search

colorscheme night-owl

filetype indent plugin on
syntax on

set nocompatible              " be iMproved, required
set number
set noswapfile
set smartcase

set hidden
set wildmenu
set nohlsearch
set autoindent
set ruler
set laststatus=2
set confirm
set backspace=indent,eol,start
set backup
set dir=~/.config/nvim/tmp
set t_vb=
set mouse=a
set number
set relativenumber
set tabstop=2
set shiftwidth=0
set softtabstop=2
set expandtab
set cursorline
set noshowmode
set nowrap
set nolbr
set bg=dark
scriptencoding utf-8
set encoding=utf-8
set guioptions-=m
set guioptions-=M
set guioptions-=T
set guioptions-=r
set guioptions-=L
au GUIEnter * simalt ~x
au BufNewFile,BufRead *.ejs set filetype=html
let g:python3_host_prog="/usr/bin/python3"
set nocompatible
set smartcase
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000
set updatetime=1000
nmap <C-S> :w<CR>
imap <C-S> <C-O>:w<CR>
set backupdir=~/.local/share/nvim/backup

command -nargs=? -complete=file Todo execute "Ack" 'TODO\|FIXME\|XXX' <f-args>
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <C-n> :NERDTreeToggle<CR>

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <F5> :Todo<CR>

" Map open terminal in root directory
nmap <silent> <leader>t :silent exec "!gnome-terminal &"<CR>
"imap <silent> <C-`> <C-O>:silent exec !gnome-terminal"<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
"nmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <TAB> <Plug>(coc-range-select)
"xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"Prettier cfg
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

let g:NERDTreeChDirMode=2
" view current buffer in nerdtree
nmap <leader>r :NERDTreeFind<cr>

 " Ctrl+h/l move cursor to the start/end of the line
nmap <c-l> $
omap <c-l> $
vmap <c-h> ^
vmap <c-l> $
nmap <c-h> ^
" Ctrl+h/j/k/l act as arrow keys in insert mode
imap <c-k> <Up>
imap <c-l> <Right>
imap <c-j> <Down>
imap <c-h> <Left>


" Ctrl+Enter inserts a newline below the cursor in insert mode (not altering
" text after cursor)
imap <c-Enter> <c-o>o
" Shift+Enter inserts a newline above the cursor in insert mode (not altering
" text after cursor)
imap <s-Enter> <c-o><s-o>
