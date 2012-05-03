require 'prime'
require 'set'

PRIMES = Set.new

def prime?(n)
  PRIMES.member?(n)
end

sum = 0
total = 0
Prime.each do |n|
  PRIMES.add(n)
  next if n < 10
  str_head = n.to_s
  str_tail = str_head.clone
  bad_value = false
  until (str_head[0] = str_tail[-1] = ''
         str_head.empty?)
    unless prime?(str_head.to_i) && prime?(str_tail.to_i)
      bad_value = true
      break
    end
  end
  next if bad_value

  sum += n
  break if 11 <= (total += 1)
end
puts sum
