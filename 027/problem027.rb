require 'prime'

# Result is prime, so: n^2 + na + b > 0 and 'b' should be a prime.
# n = 0: 0 < b
# n = 1: -b-1 < a
#        -b <= a

max, ma, mb = 0, 0, 0
Prime.each.take_while{ |n| n < 1000 }.each do |b|
  (-b).upto(999) do |a|
    n = 1 # It is certainly a prime number in the case of n = 0.

    # Maybe a bug: "Integet#prime?" returns true if n <= 1.
    # (ruby 1.9.1p0 (2009-01-30 revision 21907) [i486-linux])
    n += 1 while 1 < (s = (n**2 + a*n + b)) && s.prime?
    max, ma, mb = n, a, b if max < n
  end
end
puts ma * mb
