require 'prime'

primes = [1] + Prime.each.take(7)
(0..9).to_a.permutation.select do |x|
  res = true
  x.each_cons(3).each_with_index do |s, i|
    (res = false; break) if s.inject{ |r, n| r * 10 + n } % primes[i] != 0
  end
  res
end.map{ |x| x.inject{ |r, n| r * 10 + n} }.inject(:+).display
