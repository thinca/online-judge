100.downto(1).inject(:*).to_s.each_char.map{ |c| c.to_i }.inject(:+).display
