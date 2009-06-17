require 'mathn'

r = 1 / 2
count = 0
(1..1000).each do |n|
  s = 1 + r
  count += 1 if s.denominator.to_s.length < s.numerator.to_s.length
  r = 1 / (2 + r)
end
puts count
