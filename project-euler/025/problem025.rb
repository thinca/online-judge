n = 0
b = 1
c = 0
while n.to_s.length < 1000
  a = n
  n += b
  b = a
  c += 1
end
puts c
