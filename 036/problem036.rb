def palindromic?(n, base = 10)
  s = n.to_s(base)
  s == s.reverse
end

1.step(1000000, 2).select{ |n| palindromic?(n) && palindromic?(n, 2) }.inject(:+).display
