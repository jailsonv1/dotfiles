"---------------------------------------------------------------------------- " Jailson Araujo Vimrc configuration
"----------------------------------------------------------------------------
set nocompatible
syntax on
set nowrap
set tags=tags
set encoding=UTF-8
set showcmd
set autoindent

filetype off                  " required
" filetype plugin indent on
call plug#begin('~/.vim/plugged')

" Stylization Language
Plug 'styled-components/vim-styled-components'
Plug 'nikvdp/ejs-syntax'
Plug 'soywod/typescript.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }
Plug 'pangloss/vim-javascript'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'xuyuanp/nerdtree-git-plugin'

"theme
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Utility
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdtree'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'chun-yang/auto-pairs'
Plug 'neoclide/coc.nvim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'

call plug#end()

"----------------------------------------------------------------------------
" Configuration Section
"----------------------------------------------------------------------------
let g:coc_global_extensions = ['coc-angular', 'coc-tslint', 'coc-jest', 'coc-html', 'coc-emmet', 'coc-css', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets']

" remove final newline
" autocmd BufWritePre * %s/\s\+$//e
set noendofline binary

" highlight column
set colorcolumn=80
set cursorcolumn
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Show linenumbers
set number
set ruler

" Set Proper Tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set relativenumber

" show all comands
set wildmenu

" enable mouse
set mouse=a

" Enable highlighting of the current line
set cursorline

" Enable incremental search
set incsearch

" Highlight matching search patterns
set hlsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-i> :nohl<CR><C-i>

" close automatic of the char
imap { {}<left>
imap ( ()<left>
imap [ []<left>

" Theme and Styling
set t_Co=256
set background=dark
if (has("termguicolors"))
 set termguicolors
endif
let g:gruvbox_termcolors=16
let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme gruvbox
colorscheme onedark
" colorscheme nord
set background=dark

let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

:bnext
:bprevious

nmap <leader>= :bnext<CR>
nmap <leader>- :bprevious<CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>1 :bfirst<CR>
nmap <leader>2 :bfirst<CR>:bn<CR>
nmap <leader>3 :bfirst<CR>:2bn<CR>
nmap <leader>4 :bfirst<CR>:3bn<CR>

au BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss set iskeyword+=-

"----------------------------------------------------------------------------
" NERDTree Configuration
"----------------------------------------------------------------------------
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
" Open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" When open change the focus to the file (and not the NERDTree)
autocmd! VimEnter * NERDTree | wincmd w

" close nerd tree with char 'q'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

"----------------------------------------------------------------------------
" NERDTREE Highligth
"----------------------------------------------------------------------------

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
""----------------------------------------------------------------------------
"" CONFIG AIRLINE
""----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'

let g:airline_powerline_fonts = 1
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatte = 'jsformatter'

let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type= 2
let g:airline#extensions#tabline#show_tab_type = 1

let g:airline#extensions#whitespace#enabled = 0

"----------------------------------------------------------------------------
" GitGutter Configuration
"----------------------------------------------------------------------------
let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✱'
let g:gitgutter_sign_removed = '⬎'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '྾'

nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

autocmd BufWritePost * GitGutter

"----------------------------------------------------------------------------
" Ultisnips Configuration
"----------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger="<C-L>"

"----------------------------------------------------------------------------
" ALE Configuration
"----------------------------------------------------------------------------
let g:ale_linters = {
\ 'typescript': ['eslint', 'tsserver', 'typecheck'],
\ 'javascript': ['eslint'],
\ 'typescriptreact': ['eslint', 'tsserver', 'typecheck'],
\}

let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\}

" Completion
let g:ale_completion_enabled = 1

let g:ale_javascript_prettier_use_local_config = 1

let g:ale_completion_autoimport = 1

let g:airline#extensions#ale#enabled = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1

" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 0

" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open = 1

"  How can I navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
"----------------------------------------------------------------------------
" Emmet Configuration
"----------------------------------------------------------------------------
"Enable just for html/css
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key='<C-F>'


"----------------------------------------------------------------------------
" COC Config standard
"----------------------------------------------------------------------------

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

