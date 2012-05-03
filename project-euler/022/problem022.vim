let names = sort(eval('[' . readfile('names.txt', 'b')[0] . ']'))
let [i, sum] = [1, 0]
for n in names
  let score = 0
  for s in range(strlen(n))
    let score += char2nr(n[s]) - 64
  endfor
  let names[i - 1] = i * score
  let i += 1
endfor
echo eval(join(names, '+'))
