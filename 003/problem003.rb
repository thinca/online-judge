e = 600851475143
n = 2
while n < e
  if e % n == 0
    e /= n
  else
    n += 1
  end
end
e.display
