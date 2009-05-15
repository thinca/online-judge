let s:triangle_numbers = {'count' : 0, 'max' : 0}

function! s:is_triangle_number(n)
  while s:triangle_numbers.max <= a:n
    let c = s:triangle_numbers.count + 1
    let s:triangle_numbers.max = c * (c + 1) / 2
    let s:triangle_numbers[s:triangle_numbers.max] = 1
    let s:triangle_numbers.count = c
  endwhile
  return has_key(s:triangle_numbers, a:n)
endfunction

function! s:word_value(w)
  let n = 0
  let i = strlen(a:w)
  while i
    let i -= 1
    let n += char2nr(a:w[i]) - 64
  endwhile
  return n
endfunction

function! s:problem042(file)
  let words = eval('[' . readfile(a:file, 'b')[0] . ']')
  return len(filter(words, 's:is_triangle_number(s:word_value(v:val))'))
endfunction

echo s:problem042(expand('<sfile>:h') . '/words.txt')
