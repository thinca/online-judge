function! s:is_pythagorean_triplet(a, b, c)
  return a:a * a:a + a:b * a:b == a:c * a:c
endfunction

let a = 1
let b = 1
let c = 998
while !s:is_pythagorean_triplet(a, b, c)
  if b < c
    let b += 1
    let c -= 1
  else
    let a += 1
    let b = a
    let c = 1000 - a - b
    if c < 1
      echoerr 'Failed to find a answer.'
    endif
  endif
endwhile
echo a * b * c
