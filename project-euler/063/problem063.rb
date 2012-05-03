require 'set'

def digits(n)
  n.to_s.length
end

n = 1
nums = Set.new

hit = true
while hit
  b = 1
  d = 0
  hit = false
  while d <= n
    num = b ** n
    b += 1
    if nums.member?(num)
      next
    end
    d = digits(num)
    if n == d
      nums << num
      hit = true
    end
  end
  n += 1
end

puts nums.size
