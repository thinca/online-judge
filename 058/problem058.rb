require 'prime'

side = 1
base = 1
all = 1
primes = 0
begin
  d = side + 1
  1.upto(4) do
    base += d
    primes += 10 if base.prime?
  end
  side += 2
  all += 4
end while all <= primes
puts side
