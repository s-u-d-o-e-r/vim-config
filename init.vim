call plug#begin('~/.vim/plugged')
    " Auto-completion for quotes, parens, brackets
    Plug 'Raimondi/delimitMate'
    " Enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'
    " Repeat command extended to visual mode.
    Plug 'inkarkat/vim-visualrepeat'
    " Brings physics-based smooth scrolling
    Plug 'yuttie/comfortable-motion.vim'
    " Color scheme
    Plug 'arcticicestudio/nord-vim'
    " A dark colorscheme with vibrant colors
    Plug 'flrnprz/candid.vim'
    "Plug 'mileszs/ack.vim'
    "A Git wrapper
    Plug 'tpope/vim-fugitive'
    " Fake data generator
    Plug 'tkhren/vim-fake'
    " Buffers close menu
    Plug 'Asheq/close-buffers.vim'
    " React code snippets
    Plug 'epilande/vim-react-snippets'
    " Switch between single-line and multiline forms of code
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Include source for coc.nvim
    Plug 'Shougo/neoinclude.vim'
    " Include source for coc.nvim
    Plug 'jsfaint/coc-neoinclude'
    Plug 'neoclide/coc.nvim', {'branch': 'release','tag': '*', 'do': { -> coc#util#install()}}
    " Color scheme
    Plug 'haishanh/night-owl.vim'
    " Screenshot maker
    Plug 'kristijanhusak/vim-carbon-now-sh'
    " A lightweight and powerful git branch viewer for vim.
    Plug 'rbong/vim-flog'
    " A solid language pack for Vim.
    Plug 'sheerun/vim-polyglot'
    " Fuzzy file, buffer, mru, tag, etc finder
    Plug 'ctrlpvim/ctrlp.vim'
    " Lean & mean status/tabline for vim that's light as air
    Plug 'bling/vim-airline'
    " Themes for airline
    Plug 'vim-airline/vim-airline-themes'
    " Snippets support
    Plug 'Shougo/neosnippet.vim'
    " Default snippets
    Plug 'Shougo/neosnippet-snippets'
    " Print documents in echo area.
    Plug 'Shougo/echodoc.vim'
    " Extended session management for Vim
    Plug 'xolox/vim-session'
    " Required for vim-session
    Plug 'xolox/vim-misc'
    " File extensions icons
    Plug 'ryanoasis/vim-devicons'
    " (Do)cumentation (Ge)nerator 15+ languages  Generate proper code documentation skeletons with a single keypress.
    Plug 'kkoomen/vim-doge'
    " Vim bundle for styled-components based javascript files.
    Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    " A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
    Plug 'jparise/vim-graphql'
    " Modern performant generic finder and dispatcher for Vim and NeoVim
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
    " Color scheme
    Plug 'drewtempelmeyer/palenight.vim'
    " The undo history visualizer for VIM
    Plug 'mbbill/undotree'
    " Commentary.vim: comment stuff out 
    Plug 'tpope/vim-commentary'
    " The fancy start screen for Vim.
    Plug 'mhinz/vim-startify'
    " The open source plugin for productivity metrics, goals, leaderboards, and automatic time tracking.
    Plug 'wakatime/vim-wakatime'
    " A Vim plugin which shows git diff markers in the sign column
    Plug 'airblade/vim-gitgutter'
    " Use RipGrep in Vim and display results in a quickfix list
    Plug 'jremmen/vim-ripgrep'
    " Changes Vim working directory to project root (identified by presence of known directory or file).
    Plug 'airblade/vim-rooter'
    " Vim motions on speed!
    Plug 'easymotion/vim-easymotion'
    " Have Vim automatically reload a file that has changed externally
    Plug 'djoshea/vim-autoread'
    " Plugin manager for coc
    Plug 'theoldmoon0602/coc-plug'
    " Color scheme
    Plug 'joshdick/onedark.vim'
    " Motions to and inside git conflict markers
    Plug 'rhysd/conflict-marker.vim'
call plug#end()

call coc_plug#begin()
    CocPlug 'coc-yank'
    CocPlug 'coc-word'
    CocPlug 'coc-spell-checker'
    CocPlug 'coc-snippets'
    CocPlug 'coc-prettier'
    CocPlug 'coc-neosnippet'
    CocPlug 'coc-marketplace'
    CocPlug 'coc-lists'
    CocPlug 'coc-jest'
    CocPlug 'coc-java'
    CocPlug 'coc-highlight'
    CocPlug 'coc-git'
    CocPlug 'coc-explorer'
    CocPlug 'coc-eslint'
    CocPlug 'coc-emoji'
    CocPlug 'coc-emmet'
    CocPlug 'coc-diagnostic'
    CocPlug 'coc-calc'
    CocPlug 'coc-actions'
    CocPlug 'coc-xml'
    CocPlug 'coc-tsserver'
    CocPlug 'coc-svg'
    CocPlug 'coc-markdownlint'
    CocPlug 'coc-json'
    CocPlug 'coc-html'
    CocPlug 'coc-css' 
call coc_plug#end()

let mapleader = ' '
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'float'

" gist
let g:gist_detect_filetype = 1

let g:gist_open_browser_after_post = 1
let g:gist_post_private = 1

"start page

let g:startify_session_dir = '~/.vim/sessions'

" screenshots
let g:carbon_now_sh_options =
\ { 'ln': 'false',
\ 'fm': 'Fira Code',
\ 't':'night-owl'}

vnoremap <F3> :CarbonNowSh<CR>
nnoremap <F5> :UndotreeToggle<cr>



nmap <C-S> :w<CR> 
imap <C-S> <C-O>:w<CR>
nmap <C-A> :noa w<CR>  
imap <C-A> <C-O>:noa w<CR>


imap <C-p> <Esc>"+pa
"nmap <C-v> "+p
"vmap <C-v> xh"+pi

vnoremap <C-c> "+y

vnoremap <C-x> "+d

noremap y "*y
noremap p "*p
noremap Y "+y
noremap P "+p



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


nmap <S-Right> :bnext<CR>
nmap <S-Left> :bprev<CR>



" If you have vim >=8.0 or Neovim >= 0.1.5
if (has('termguicolors'))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" List occurrences for search

colorscheme candid "night-owl palenight nord onedark candid

filetype indent plugin on
syntax on

set number
set noswapfile
set smartcase
set autoread
set hidden
set wildmenu
set nohlsearch
"set autoindent
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
set encoding=utf-8
scriptencoding utf-8
set guioptions-=m
set guioptions-=M
set guioptions-=T
set guioptions-=r
set guioptions-=L

let g:python3_host_prog='/usr/local/bin/python3'
"set nocompatible
set smartcase
set noshowmode
set noruler
set laststatus=0
set noshowcmd
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set backupdir=~/.local/share/nvim/backup

"command! -nargs=? -complete=file Todo execute 'Ack' 'TODO\|FIXME\|XXX' <f-args>
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=1

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50

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


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <C-n> :CocCommand explorer<CR>
" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

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



" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

 let g:emmetJsx = 1
augroup mygroup

  au GUIEnter * simalt ~x
  au BufNewFile,BufRead *.ejs set filetype=html

  autocmd CursorHold * silent syntax sync fromstart

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  autocmd!
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

map <silent> <leader>ff :call CocAction('format')<CR>




map <leader>fa <leader>xs<leader>xf


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command, '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)


"Clap
map <leader><leader>g :Clap grep<Cr>
map <leader><leader>f :Clap files<CR>
map <leader><leader>p :Clap providers<CR>


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

"easy motion
map <Leader> <Plug>(easymotion-prefix)
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" Gif config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" keep cursor column when JK motion

let g:EasyMotion_startofline = 0 
let g:EasyMotion_smartcase = 1

"nnoremap <leader>ps :call pim#interrupt()<cr>

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" Remapping for windows movements
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

" Maps for fugitive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" Git conflict markers settings
highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
