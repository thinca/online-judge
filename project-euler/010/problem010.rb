require 'mathn'
Prime.each.take_while{|n| n <= 2000000 }.inject(:+).display
