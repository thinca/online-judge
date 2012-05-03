require 'prime'
require 'set'

MAXIMUM = 1000000
PRIMES = Prime.each.take_while{ |n| n < MAXIMUM }.to_set

def rotate_numbers(n)
  list = []
  s = n.to_s
  s.length.times do
    s << s[0]
    s[0] = ''
    list.push s.to_i
  end
  return list
end

def prime?(n)
  return PRIMES.member?(n) if n < MAXIMUM
  Prime.prime?(n)
end

circular_primes = Set.new

PRIMES.each do |n|
  next if circular_primes.member?(n)
  nums = rotate_numbers(n)
  if nums.all?{ |e| prime?(e) }
    nums.each{ |p| circular_primes.add(p) if p < MAXIMUM }
  end
end

circular_primes.size.display
