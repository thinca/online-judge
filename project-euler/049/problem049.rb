require 'prime'

Prime.each.take_while{ |n| n < 10000}.drop_while{ |n| n < 1000 }.each do |a|
  digits = a.to_s.chars.sort
  max = (10000 - a) / 2
  d = 0
  while d < max
    d += 2
    next if a == 1487 && d == 3330
    success = true
    1.upto(2) do |n|
      x = a + d * n
      if x.to_s.chars.sort != digits || !x.prime?
        success = false
        break
      end
    end
    if success
      puts (0..2).inject(''){ |ans, n| ans += '%04d' % (a + d * n) }
      exit
    end
  end
end
