require 'prime'

PURPOSE = 4
n = 1
count = 0
while count < PURPOSE
  count = n.prime_division.length == PURPOSE ? count + 1 : 0
  n += 1
end

puts n - PURPOSE
