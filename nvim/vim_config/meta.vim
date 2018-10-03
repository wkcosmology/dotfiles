function! OpenRuntime()
  let l:runtime_path =  fnamemodify($MYVIMRC, ':p:h')

  if match(getline('.'), '^\s*runtime') > -1
    let l:file_name = substitute(getline('.'), '\v.*runtime\s+(.*)$' , '\1', '')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif

  if match(getline('.'), '\v\.yml$') > -1
    let l:file_name = matchstr(getline('.'), '\v("\s*)@<=(\S*.yml)')
    exec 'edit ' . l:runtime_path . '/' . l:file_name
  endif
endfunction

function! MyFoldText()
    let l:txt = substitute(getline(v:foldstart), '\v\{\{\{', '', 'g')
    let l:txt = substitute(l:txt, '\v"?', '', '')

    return l:txt . repeat(' ', winwidth(0))
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


function! SyntaxInclude(lang, b, e, inclusive)

  let syns = split(globpath(join(split(expand('~/.config/nvim/bundle/*'),'\n'), ','), "syntax/ruby.vim"), "\n")
  if empty(syns)
    return
  endif

  if exists('b:current_syntax')
    let csyn = b:current_syntax
    unlet b:current_syntax
  endif

  let z = "'" " Default
  for nr in range(char2nr('a'), char2nr('z'))
    let char = nr2char(nr)
    if a:b !~ char && a:e !~ char
      let z = char
      break
    endif
  endfor

  silent! exec printf("syntax include @%s %s", a:lang, syns[0])
  if a:inclusive
    exec printf('syntax region %sSnip start=%s\(%s\)\@=%s ' .
          \ 'end=%s\(%s\)\@<=\(\)%s contains=@%s containedin=ALL',
          \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  else
    exec printf('syntax region %sSnip matchgroup=Snip start=%s%s%s ' .
          \ 'end=%s%s%s contains=@%s containedin=ALL',
          \ a:lang, z, a:b, z, z, a:e, z, a:lang)
  endif

  if exists('csyn')
    let b:current_syntax = csyn
  endif
endfunction

" http://genkisugimoto.com/blog/manage-vim-plugins-via-yaml/
function! LoadYaml(filename)
  let l:filename = fnamemodify($MYVIMRC, ':p:h') . '/' . a:filename

ruby << EOF
  require 'yaml'
  obj = YAML.load_file(File.expand_path(VIM::evaluate('l:filename')))
  obj_hash = obj.inspect.gsub('=>', ':').gsub('nil', '{}')
  VIM::command("let l:ret = #{obj_hash}")
EOF

  return l:ret
endfunction

augroup nvim_init_group
  autocmd!
  autocmd BufRead init.vim nnoremap <buffer><silent> gf :call OpenRuntime()<cr>
  autocmd BufRead,BufEnter scripts.vim setlocal foldtext=MyFoldText()
  autocmd BufRead,BufEnter scripts.vim setlocal foldmethod=marker
  autocmd BufRead,BufEnter scripts.vim setlocal foldlevel=0
  autocmd BufRead,BufEnter *.vim call SyntaxInclude('ruby', 'ruby << EOF', 'EOF', 0)
  autocmd FileType vim call SyntaxInclude('ruby', 'ruby << EOF', 'EOF', 0)
  autocmd BufRead plugins.vim nnoremap <buffer><silent> go :call OpenPluginInGithub()<cr>
  autocmd BufRead plugins.vim nnoremap <buffer><silent> gf :call OpenPluginConfig()<cr>
augroup END
