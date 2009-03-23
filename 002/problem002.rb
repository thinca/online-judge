sum = 0
n = 0
b = 1
while n < 4000000
  sum += n if n % 2 == 0
  a = n
  n += b
  b = a
end
sum.display

