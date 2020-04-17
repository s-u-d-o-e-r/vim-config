call plug#begin("~/.vim/plugged")
    Plug 'tpope/vim-surround'
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-repeat'
    Plug 'inkarkat/vim-visualrepeat'
    Plug 'yuttie/comfortable-motion.vim'
    Plug 'arcticicestudio/nord-vim'
    Plug 'flrnprz/candid.vim'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'tkhren/vim-fake'
    Plug 'Asheq/close-buffers.vim'
    " React code snippets
    Plug 'epilande/vim-react-snippets'
    "Plug 'pangloss/vim-javascript'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'inkarkat/vim-CountJump'
    Plug 'inkarkat/vim-ingo-library'
    Plug 'w0rp/ale'
    Plug 'kana/vim-textobj-user'
    Plug 'Julian/vim-textobj-variable-segment'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'haishanh/night-owl.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'kristijanhusak/vim-carbon-now-sh'
    Plug 'rbong/vim-flog'
    Plug 'haya14busa/incsearch.vim'
    Plug 'inkarkat/vim-visualrepeat'
    "Plug 'wellle/context.vim'
    Plug 'inkarkat/vim-ingo-library'
    Plug 'mileszs/ack.vim'
    Plug 'sheerun/vim-polyglot'
    "Plug 'honza/vim-snippets'
    "Plug 'scrooloose/nerdTree'
    Plug 'tveskag/nvim-blame-line'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'Shougo/echodoc.vim'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-session'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'heavenshell/vim-jsdoc'
    Plug 'kkoomen/vim-doge'
    Plug 'vim-syntastic/syntastic'
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'jparise/vim-graphql'
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'tpope/vim-unimpaired'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-commentary'
    Plug 'mhinz/vim-startify'
    Plug 'wakatime/vim-wakatime'
    Plug 'mattn/vim-gist'
    Plug 'airblade/vim-gitgutter'
    Plug 'jremmen/vim-ripgrep'
    Plug 'airblade/vim-rooter'
    call plug#end()




let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'

" gist
let g:gist_detect_filetype = 1

let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

"start page

let g:startify_session_dir = "~/.vim/sessions"

" screenshots
let g:carbon_now_sh_options =
\ { 'ln': 'false',
\ 'fm': 'Fira Code',
\ 't':'night-owl'}

vnoremap <F3> :CarbonNowSh<CR>
nnoremap <F5> :UndotreeToggle<cr>

"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
" Ale settings
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
"let g:ale_sign_error = ''
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1


let g:blameLineVirtualTextPrefix = '|>'

"config JsDoc



"nmap <silent> <C-l> <Plug>(jsdoc)
"let g:jsdoc_allow_input_prompt = 1 
"let g:jsdoc_input_description = 1
"let g:jsdoc_enable_es6 = 1
"let g:jsdoc_param_description_separator = ' => '

" config for ctrl+p, ctrl+v, ctrl+x  

nmap <C-S> :w<CR>
imap <C-S> <C-O>:w<CR>


imap <C-p> <Esc>"+pa
"nmap <C-v> "+p
"vmap <C-v> xh"+pi

vnoremap <C-c> "+y

vnoremap <C-x> "+d

noremap y "*y
noremap p "*p
noremap Y "+y
noremap P "+p

"for formatting
autocmd CursorHold * silent syntax sync fromstart

let g:blamer_delay = 500
"session config
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_to = 'default'
let g:session_verbose_messages = 0



""""" enable 24bit true color
"airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'


nmap <S-Right> ]b
nmap <S-Left> [b



" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" List occurrences for search

colorscheme night-owl "palenight

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
let g:python3_host_prog="/usr/local/bin/python3"
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

set backupdir=~/.local/share/nvim/backup

command! -nargs=? -complete=file Todo execute "Ack" 'TODO\|FIXME\|XXX' <f-args>
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

"nmap <C-n> :NERDTreeToggle<CR>
nmap <C-n> :CocCommand explorer<CR>
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

let g:emmetJsx = 1
augroup mygroup
  autocmd!
  autocmd BufEnter * EnableBlameLine
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

 autocmd FileType apache setlocal commentstring=#\ %s



autocmd CursorMoved,CursorMovedI,BufEnter *
\   if exists('*IsStyledDefinition') |
\     if IsStyledDefinition(line('.')) && g:emmetJsx |
\       call coc#config('emmet.includeLanguages', { "javascript": "css" } ) |
\       let g:emmetJsx = 0 |
\     elseif !IsStyledDefinition(line('.')) && !g:emmetJsx |
\       call coc#config('emmet.includeLanguages', { "javascript": "javascriptreact" } ) |
\       let g:emmetJsx = 1 |
\     endif |
\   endif

autocmd CursorMoved,BufEnter *
\   if &filetype == "coc-explorer" |
\     execute "norm 0" |
\   endif



augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@



" Remap for do codeAction of current line
nmap <silent> <leader>ac  :<C-u> CocCommand actions.open<cr>
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


map <leader>fs :CocCommand eslint.executeAutofix<CR>

map <leader>ff :CocCommand prettier.formatFile<CR>


map <leader>fa <leader>xs<leader>xf



" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', 'none')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', 'none')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'none')

let g:NERDTreeChDirMode=2

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" view current buffer in nerdtree
nmap <leader>r :NERDTreeFind<cr>

 " Ctrl+h/l move cursor to the start/end of the line
"nmap <c-l> $
"omap <c-l> $
"vmap <c-h> ^
"vmap <c-l> $
"nmap <c-h> ^


" Ctrl+h/j/k/l act as arrow keys in insert mode
" imap <C-k> <Up>
" imap <C-l> <Right>
" imap <C-j> <Down>
" imap <C-h> <Left>


" Ctrl+Enter inserts a newline below the cursor in insert mode (not altering
" text after uursor)
imap <c-Enter> <c-o>o
" Shift+Enter inserts a newline above the cursor in insert mode (not altering
" text after cursor)
imap <s-Enter> <c-o><s-o>



"hi! Normal guibg=NONE
"hi! NonText guibg=NONE guifg=white
"hi! CursorLine guibg=NONE
"hi! NonText guibg=NONE
"hi! EndOfBuffer guibg=NONE
"hi! LineNr guibg=NONE guifg=#dedede
"hi! CursorLineNr guibg=NONE guifg=#dedede
"hi! SignColumn guibg=NONE
"hi! statusline ctermfg=NONE

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


"Clap
command! Cg Clap grep
command! Cf Clap files
command! Cp Clap providers


imap <C-F> <C-O>:Cp<CR>


" Fake

"" Choose a random element from a list
call fake#define('sex', 'fake#choice(["male", "female"])')

"" Get a name of male or female
"" fake#int(1) returns 0 or 1
call fake#define('name', 'fake#int(1) ? fake#gen("male_name")'
                                  \ . ' : fake#gen("female_name")')

"" Get a full name
call fake#define('fullname', 'fake#gen("name") . " " . fake#gen("surname")')

"" Get a nonsense text like Lorem ipsum
call fake#define('sentense', 'fake#capitalize('
                        \ . 'join(map(range(fake#int(3,15)),"fake#gen(\"nonsense\")"))'
                        \ . ' . fake#chars(1,"..............!?"))')

call fake#define('paragraph', 'join(map(range(fake#int(3,10)),"fake#gen(\"sentense\")"))')

"" Alias
call fake#define('lipsum', 'fake#gen("paragraph")')

"" Get an age weighted by generation distribution
call fake#define('age', 'float2nr(floor(110 * fake#betapdf(1.0, 1.45)))')

"" Get a domain (ordered by number of websites)
call fake#define('gtld', 'fake#get(fake#load("gtld"),'
                        \ . 'fake#betapdf(0.2, 3.0))')

call fake#define('email', 'tolower(substitute(printf("%s@%s.%s",'
                        \ . 'fake#gen("name"),'
                        \ . 'fake#gen("surname"),'
                        \ . 'fake#gen("gtld")), "\\s", "-", "g"))')



" Buffers delete
nnoremap <silent> <C-q> :Bdelete menu<CR>
