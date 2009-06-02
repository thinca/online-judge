let s:pentagonal_numbers = {'count' : 0, 'max' : 0}
let g:pn = s:pentagonal_numbers

function! s:pentagonal_number(n)
  return a:n * (3 * a:n - 1) / 2
endfunction

function! s:is_pentagonal_number(x)
  while s:pentagonal_numbers.max <= a:x
    let s:pentagonal_numbers.count += 1
    let max = s:pentagonal_number(s:pentagonal_numbers.count)
    let s:pentagonal_numbers.max = max
    let s:pentagonal_numbers[max] = 1
  endwhile
  return has_key(s:pentagonal_numbers, a:x)
endfunction

function! s:problem044()
  let n = 1
  while 1
    let target = s:pentagonal_number(n)
    let m = n - 1
    while 0 < m
      let pn = s:pentagonal_number(m)
      if s:is_pentagonal_number(target - pn)
      \ && s:is_pentagonal_number(target + pn)
        return target - pn
      endif
      let m -= 1
    endwhile
    let n += 1
  endwhile
endfunction

echo s:problem044()
