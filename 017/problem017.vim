let s:digits1 = split('zero one two three four five six seven eight nine')
let s:digits2 =
  \ split('zero ten twenty thirty forty fifty sixty seventy eighty ninety')
let s:teens =
  \ split('ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen')

function! s:num2en(n)
  let s = reverse(map(split(a:n, '\zs'), 'v:val - 0'))
  let digits = len(s)

  let result = s:digits1[s[0]]

  if 2 <= digits
    if s[0] == 0
      let result = ''
    endif

    if s[1] == 1
      let result = s:teens[s[0]]
    elseif s[1] != 0
      let result = s:digits2[s[1]] . (empty(result) ? '' : '-') . result
    endif
  endif

  if 3 <= digits
    if s[2] != 0
      let result = s:digits1[s[2]] . ' hundred' .
        \ (empty(result) ? '' : ' and') . ' ' . result
    endif
  end

  if 4 <= digits
    if s[3] != 0
      let result = s:digits1[s[3]] . ' thousand' .
        \ (empty(result) ? '' : ' and') . ' ' . result
    endif
  end

  return result
endfunction

let sum = 0
for i in range(1, 1000)
  let sum += strlen(substitute(s:num2en(i), '[ -]', '', 'g'))
endfor
echo sum
