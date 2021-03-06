function! OpenRuntime()
  let l:runtime_path = stdpath('config')

  if match(getline('.'), '\v\.lua$') > -1
    let l:file_name = matchstr(getline('.'), '\v("\s*)@<=(\S*\.lua)')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif

  if match(getline('.'), '\v^\s*lua require') > -1
    let l:file_name = matchstr(getline('.'), '\v(lua require '."'".')@<=\S*'."(')@=")
    exec 'edit ' . l:runtime_path . '/lua/' . l:file_name . '.lua'
  endif

  if match(getline('.'), '^\s*runtime') > -1
    let l:file_name = substitute(getline('.'), '\v.*runtime\s+(.*)$' , '\1', '')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif

  if match(getline('.'), '\v\.yml$') > -1
    let l:file_name = matchstr(getline('.'), '\v("\s*)@<=(\S*.yml)')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif

  if match(getline('.'), '\v\.json$') > -1
    let l:file_name = matchstr(getline('.'), '\v("\s*)@<=(\S*.json)')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif
endfunction

function! MyFoldText()
  let l:txt = substitute(getline(v:foldstart), '\v\{\{\{', '', 'g')
  let l:comment = substitute(&commentstring, '\v\s?\%s', '', '')
  let l:txt = substitute(l:txt, '\v' . l:comment . '\s?', '', '')

  return '+- ' . l:txt . repeat(' ', winwidth(0))
endfunction

function! OpenPluginInGithub()
  let l:regexp =  "\\v(Plug.*')@<=\\S*(')@="

  if match(getline('.'), l:regexp) == -1 | return | endif

  call system('xdg-open https://github.com/' . matchstr(getline('.'), l:regexp))
endfunction


function! OpenPluginConfig()
  let l:regexp =  "\\v(Plug.*')@<=\\S*(')@="

  if match(getline('.'), l:regexp) == -1 | return | endif

  let l:plugin_name = matchstr(getline('.'), l:regexp)
  let l:runtime_path =  fnamemodify($MYVIMRC, ':p:h')

  exec 'edit ' . l:runtime_path . '/vim_config/plugins_config.vim'
  if !search(l:plugin_name, 'w')

    let l:marks = repeat('=', (47 - len(l:plugin_name)) / 2)
    let l:str = '" ' . l:marks . ' ' . l:plugin_name . ' ' . l:marks
    let l:str .= repeat('=', 52 - len(l:str))

    call append(line('$'), ['','', l:str, ''])
    normal! G
  endif

  normal! zt
endfunction

" " http://genkisugimoto.com/blog/manage-vim-plugins-via-yaml/
" function! LoadYaml(filename)
"   let l:filename = fnamemodify($MYVIMRC, ':p:h') . '/' . a:filename

" ruby << EOF
"   require 'yaml'
"   obj = YAML.load_file(File.expand_path(VIM::evaluate('l:filename')))
"   obj_hash = obj.inspect.gsub('=>', ':').gsub('nil', '{}')
"   VIM::command("let l:ret = #{obj_hash}")
" EOF

"   return l:ret
" endfunction

augroup nvim_init_group
  autocmd!
  autocmd BufRead init.vim nnoremap <buffer><silent> gf :call OpenRuntime()<cr>
  autocmd BufRead,BufEnter scripts.vim setlocal foldtext=MyFoldText()
  autocmd BufRead,BufEnter scripts.vim setlocal foldmethod=marker
  autocmd BufRead,BufEnter scripts.vim setlocal foldlevel=0
  autocmd BufRead plugins.vim nnoremap <buffer><silent> go :call OpenPluginInGithub()<cr>
  autocmd BufRead plugins.vim nnoremap <buffer><silent> gf :call OpenPluginConfig()<cr>
augroup END
