require 'mathn'

def devisor(n)
  n.prime_division.inject(1){ |r, n| ((n[0] ** (n[1] + 1) - 1) / (n[0] - 1)) * r } - n
end

devisors = (0..10000).map{ |n| n == 0 ? 0 : devisor(n) }
devisors.each_with_index.inject(0) do |sum, (n, i)|
  sum += n + i if n < i && devisors[n] == i
  sum
end.display
