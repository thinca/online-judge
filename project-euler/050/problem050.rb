require 'prime'

primes = Prime.each.take_while{ |n| n < 1000000 }
n, sum = 0, 0
max = primes.last
while sum + primes[n] <= max
  sum += primes[n]
  n += 1
end

loop do
  gsum = sum
  s = 0
  while gsum < max
    if primes.member?(gsum)
      puts gsum
      exit
    end
    gsum += primes[s + n] - primes[s]
    s += 1
  end
  n -= 1
  sum -= primes[n]
end
