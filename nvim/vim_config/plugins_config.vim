
" ============ svermeulen/vim-easyclip =============

let g:EasyClipEnableBlackHoleRedirect = 0
let g:EasyClipUseCutDefaults = 0
" let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipPreserveCursorPositionAfterYank = 1
let g:EasyClipUsePasteDefaults = 0

nmap p <plug>G_EasyClipPasteAfter
nmap P <plug>G_EasyClipPasteBefore
" nmap <c-p> <plug>EasyClipSwapPasteForward
" nmap <c-n> <plug>EasyClipSwapPasteBackwards

" =========== junegunn/vim-after-object ============

augroup vim_after_object
  autocmd!
  autocmd VimEnter * call after_object#enable(']', '[', '=', ':', ',', '-')
augroup END


" ================= junegunn/fzf ===================

let $FZF_DEFAULT_COMMAND = 'ag -l -p ~/.agignore -g ""'

nnoremap <silent> <space>oo :FZF<cr>
nnoremap <silent> <space>o :FZF<cr>
nnoremap <silent> <space>oh :History<cr>

nnoremap <space>ob :Buffers<cr>
nnoremap <space>og :GFiles?<cr>
nnoremap <space>ot  :FZF spec<cr>
nnoremap <space>ojs :FZF app/assets<cr>
nnoremap <space>oc  :FZF app/controllers<cr>
nnoremap <space>om  :FZF app/models<cr>
nnoremap <space>ov  :FZF app/views<cr>
nnoremap <space>os  :FZF app/services<cr>
nnoremap <space>of  :FZF app/form_objects<cr>
nnoremap <space>on  :FZF ~/workdir/notes<cr>

let g:fzf_history_dir = '~/.local/share/fzf-history'


" ================ dyng/ctrlsf.vim =================

"By default CtrlSF window will be opened at left, change it to right by
let g:ctrlsf_position = 'right'
nnoremap <space>f :CtrlSF -I -R 
nnoremap <silent> <space>F :CtrlSFOpen<cr>


" ================ kassio/neoterm ==================

" let g:neoterm_position = 'vertical'
" hide/close terminal
nnoremap <silent> ,th :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,tl :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> ,tc :call neoterm#kill()<cr>
nnoremap <leader>tt :Topen<cr>
nnoremap <silent> <leader>ts :TREPLSendLine<cr>
vnoremap <silent> <leader>ts :TREPLSendSelection<cr>

" tnoremap <silent> <tab>c <c-\><c-n>:call neoterm#close()<cr>
 nnoremap <silent> <f10> :TREPLSendFile<cr>

" ================ tpope/vim-rails =================

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

set viminfo^=!
let g:rails_default_file='config/database.yml'


" ============ junegunn/vim-easy-align =============

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"]


" ========== vim-ctrlspace/vim-ctrlspace ===========

if executable('ag')
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSearchTiming = 500
let g:CtrlSpaceSetDefaultMapping = 1
let g:CtrlSpaceDefaultMappingKey = '<C-D>'
let g:airline_exclude_preview = 1


" =============== janko-m/vim-test =================

nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>tn :TestNearest<cr>

let g:test#strategy = 'neoterm'
" let g:test#strategy = 'vimux'
" let g:test#strategy = 'vtr'
" let g:test#strategy = 'neovim'


" ========== junegunn/vim-lengthmatters ============

let g:lengthmatters_start_at_column = 120


" ================== mxw/vim-jsx ===================

let g:jsx_ext_required = 0


" ============= ~/projekty/show-me-db ==============

let g:ShowMeDB_default_mapping = 0
nmap <space>db <plug>show_me_db_fzf_force
nmap <space>gdb <plug>show_me_db_word_under_cursor_force


" =============== mhinz/vim-grepper ================

let g:grepper = {
    \ 'tools': ['x', 'git', 'ag'],
    \ 'x': {
    \   'grepprg':    'ag --nogroup --nocolor --column',
    \   'grepformat': '%f:%l:%m',
    \   'escape':     '\+*^$()[]',
    \ }}

nnoremap <leader>ag  :Grepper -tool ag  -open -switch -grepprg ag<cr>
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)


" ============== Yggdroot/indentLine ===============

let g:indentLine_color_term = 240


" ============= Shougo/deoplete.nvim ===============

let g:deoplete#enable_at_startup = 1
" let g:monster#completion#rcodetools#backend = 'async_rct_complete'


" =============== bling/vim-airline ================

let g:airline_theme='serene' " Theme
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" ============== scrooloose/nerdtree ===============

nnoremap <c-g><c-g> :NERDTreeToggle<cr>
nnoremap <c-g><c-f> :NERDTreeFind<cr>
" autocmd vimrc VimEnter * NERDTree
" autocmd vimrc VimEnter * wincmd p


" =============== SirVer/ultisnips =================

let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'
let g:UltiSnipsEditSplit='vertical'


" ==== othree/javascript-libraries-syntax.vim ======

let g:used_javascript_libs = 'underscore,jquery,angularjs,angularui'



" =================== w0rp/ale =====================

let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_ruby_flag = 0

let g:ale_linters = { 'ruby': ['ruby'] }

function! ChangeRubyLinters()
  if g:ale_ruby_flag
    echo 'simple'
    let g:ale_linters = { 'ruby': ['ruby'] }
    let g:ale_ruby_flag = 0
  else
    echo 'full'
    let g:ale_linters = { 'ruby': [
          \ 'rubocop',
          \ 'rails_best_practices',
          \ 'reek',
          \ 'brakeman',
          \ 'ruby'
          \ ] }
    let g:ale_ruby_flag = 1
  end
  ALELint
endfunction

let g:ale_fixers = { 'ruby': ['rubocop'], 'typescript': ['eslint', 'prettier', 'tslint'] }



command! ChangeRubyLinters call ChangeRubyLinters()
nnoremap <space>r :ChangeRubyLinters<cr>
nmap <silent> <tab>k <Plug>(ale_previous_wrap)
nmap <silent> <tab>j <Plug>(ale_next_wrap)


" ============ ryanoasis/vim-devicons ==============

autocmd FileType nerdtree setlocal nolist

" ============ plasticboy/vim-markdown =============

" let g:vim_markdown_folding_disabled = 1



" ======== autozimu/LanguageClient-neovim ==========

let g:LanguageClient_serverCommands = {
      \ 'ruby': ['tcp://localhost:7658'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'javascript.jsx': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ }

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <tab>s :call LanguageClient_textDocument_documentSymbol()<cr>
nnoremap <silent> <space>lr :call LanguageClient_textDocument_references()<cr>
nnoremap <silent> <space>ld :call LanguageClient_textDocument_definition()<CR>


" =============== vim-ruby/vim-ruby ================

let g:ruby_indent_assignment_style = 'variable'
let g:ruby_indent_block_style = 'do'
let g:ruby_operators = 1


" ========= haya14busa/vim-signjk-motion ===========

map <space>j <Plug>(signjk-j)
map <space>k <Plug>(signjk-k)


" =========== AndrewRadev/splitjoin.vim ============

let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_hanging_args = 0


" ======== nathanaelkane/vim-indent-guides =========

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234


" ============= itchyny/lightline.vim ==============

set noshowmode

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly'],
      \     ['file_name']
      \   ],
      \ 'right': [
      \   ['linter_errors', 'linter_warnings', 'linter_ok'],
      \   ['lineinfo'],
      \   ['percent'],
      \ ],
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \   'file_name': 'LightlineFilename'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \ }

let g:lightline.enable = {
      \ 'statusline': 1,
      \ 'tabline': 0
      \ }

function! LightlineFilename()
  let l:result = ''

  if &filetype ==# 'fzf' | return 'FZF' | endif
  if &filetype ==# 'nerdtree' | return '' | endif

  if expand('%:t') ==# ''
    let l:result = '[No Name]'
  else
    let l:result = expand('%')
  end

  if &modified == 1 | let l:result .= ' +' | endif

  return l:result
endfunction

let &updatetime = 2000
autocmd CursorHold,BufWritePost * call lightline#update()


" ============== alvan/vim-closetag ================

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'


" ============== tpope/vim-markdown ================

hi markdownBold ctermfg=203 cterm=bold
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'ruby']



" ======= thiagoalessio/rainbow_levels.vim =========

nnoremap <silent> <tab>r :RainbowLevelsToggle<cr>

let g:rainbow_levels = [
    \{'ctermfg': 84,  'guifg': '#50fa7b'},
    \{'ctermfg': 117, 'guifg': '#8be9fd'},
    \{'ctermfg': 61,  'guifg': '#6272a4'},
    \{'ctermfg': 212, 'guifg': '#ff79c6'},
    \{'ctermfg': 203, 'guifg': '#ffb86c'},
    \{'ctermfg': 228, 'guifg': '#f1fa8c'},
    \{'ctermfg': 15,  'guifg': '#f8f8f2'},
    \{'ctermfg': 59,  'guifg': '#6b4e32'}]
    " \{'ctermfg': 231, 'guifg': '#525563'}]

" let g:rainbow_levels = [
"     \{'ctermfg': 185, 'guifg': '#d9d762'},
"     \{'ctermfg': 109, 'guifg': '#86b4bb'},
"     \{'ctermfg': 67,  'guifg': '#6c99bb'},
"     \{'ctermfg': 98,  'guifg': '#8856d2'},
"     \{'ctermfg': 203, 'guifg': '#ef5d32'},
"     \{'ctermfg': 215, 'guifg': '#efac32'},
"     \{'ctermfg': 188, 'guifg': '#e6e1c4'},
"     \{'ctermfg': 59,  'guifg': '#6b4e32'}]


" ================ vimwiki/vimwiki =================

let g:vimwiki_list = [{'path': '~/workdir/vim_wiki'}]

" =============== reedes/vim-wheel =================

let g:wheel#map#up   = '<c-y>'
let g:wheel#map#down = '<c-e>'


" ============ Valloric/MatchTagAlways =============

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'typescript' : 1,
    \}

let g:mta_use_matchparen_group = 0


" ============== airblade/vim-rooter ===============

" let g:rooter_manual_only = 1


" =========== easymotion/vim-easymotion ============

map <space>l <Plug>(easymotion-lineforward)
map <space>j <Plug>(easymotion-j)
map <space>k <Plug>(easymotion-k)
map <space>h <Plug>(easymotion-linebackward)
nmap s <Plug>(easymotion-sl2)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1


" ======== haya14busa/incsearch-fuzzy.vim ==========

map z/ <Plug>(incsearch-fuzzy-/)
map z? <Plug>(incsearch-fuzzy-?)
map zg/ <Plug>(incsearch-fuzzy-stay)


" ========= terryma/vim-multiple-cursors ===========

nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
let g:multi_cursor_exit_from_insert_mode = 0

function! Multiple_cursors_before()
  ALEDisable
  TSStop
  cm#disable_for_buffer()
  LanguageClientStop
endfunction

function! Multiple_cursors_after()
  ALEEnable
  TSStart
  cm#enable_for_buffer()
  LanguageClientStart
endfunction

