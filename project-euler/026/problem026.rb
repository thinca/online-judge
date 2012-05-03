require 'mathn'

max = 0
maxn = 0
999.downto(1) do |n|
  break if n < max
  a = n

  n.prime_division.each do |e|
    a /= e[0] ** e[1] if e[0] == 2 || e[0] == 5
  end

  r = (1..a).find{ |e| 10 ** e % a == 1 } || 0
  max, maxn = r, n if max < r
end
puts maxn
