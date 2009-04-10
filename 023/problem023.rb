require 'mathn'

def devisor(n)
  n.prime_division.inject(1){ |r, n| ((n[0] ** (n[1] + 1) - 1) / (n[0] - 1)) * r } - n
end

abundants = (1..28123).select{ |n| n < devisor(n) }

sums = {}
abundants.each_with_index do |n, i|
  abundants.drop(i).each{ |n2| sums[n + n2] = true }
end

(1..28123).reject{ |n| sums.member?(n) }.inject(:+).display
