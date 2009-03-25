function! s:isPalindrome(n)
  let a = split(a:n, '.\zs')
  return a == reverse(copy(a))
endfunction

let max = 0
for i in reverse(range(100, 999))
  for j in reverse(range(100, i))
    let n = i * j
    if n < max
      break
    endif
    if s:isPalindrome(n)
      let max = n
    endif
  endfor
endfor
echo max
