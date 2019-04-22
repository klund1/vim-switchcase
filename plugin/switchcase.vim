function! s:IsSnakeCase(text)
  return (a:text =~ '\C^[a-z0-9_]*$') || (a:text =~ '\C^[A-Z0-9_]*$')
endfunction

" Splits the input |text| into a list of (lower case) words.
" If |text| is all the same case, the only word separator is '_'.
" If |text| contains upper and lower case letters, words are split on every
" capital letter and number-letter border.
function! s:SplitWords(text)
  if s:IsSnakeCase(a:text)
    return map(split(a:text, '_'), 'tolower(v:val)')
  endif
  " Add '_' at all word boundaries, and then split on '_'.
  let l:text=substitute(a:text, '\C[A-Z]', '_\L&', 'g')
  let l:text=substitute(l:text, '\([a-z]\)\([0-9]\)', '\1_\2', 'g')
  return split(l:text, '_')
endfunction

function! s:CapitalizeWord(index, word)
  return substitute(a:word, '^.', '\U&', '')
endfunction

function! s:ToSnakeCase(text)
  return join(s:SplitWords(a:text), '_')
endfunction

function! s:ToCapitalSnakeCase(text)
  return join(map(s:SplitWords(a:text), 'toupper(v:val)'), '_')
endfunction

function! s:ToCapitalCamelCase(text)
  return join(map(s:SplitWords(a:text), function('s:CapitalizeWord')), '')
endfunction

function! s:ToCamelCase(text)
  return substitute(s:ToCapitalCamelCase(a:text), '^.', '\L&', '')
endfunction

function! s:WordUnderCursor()
  return expand("<cword>")
endfunction

function! s:ReplaceWordUnderCursor(word)
  exec "normal! ciw" . a:word
endfunction

command! SwitchSnakeCase :noautocmd call s:ReplaceWordUnderCursor(s:ToSnakeCase(s:WordUnderCursor()))
command! SwitchCapitalSnakeCase :noautocmd call s:ReplaceWordUnderCursor(s:ToCapitalSnakeCase(s:WordUnderCursor()))
command! SwitchCamelCase :noautocmd call s:ReplaceWordUnderCursor(s:ToCamelCase(s:WordUnderCursor()))
command! SwitchCapitalCamelCase :noautocmd call s:ReplaceWordUnderCursor(s:ToCapitalCamelCase(s:WordUnderCursor()))
