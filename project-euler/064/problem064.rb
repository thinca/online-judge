def cf(n)
  w0 = Math.sqrt n
  return 0 if w0.floor ** 2 == n

  points = Fiber.new do
    l = 0
    p = 1
    w = w0
    loop do
      a = w.floor
      l = p * a - l
      p = (n - l ** 2) / p
      w = (w0 + l) / p
      Fiber.yield [l, p]
    end
  end
  p0 = points.resume
  p1 = points.resume
  i = 1
  i += 1 until points.resume == p1
  i
end

puts (2..10000).map{ |n| cf n }.select(&:odd?).count
