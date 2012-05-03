((1..100).inject(:+)**2 - (1..100).map{|i| i**2 }.inject(:+)).display
