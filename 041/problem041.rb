require 'prime'

x = nil
9.downto(1).find{ |d| d.downto(1).to_a.permutation.find{ |i| (x = i.inject(0){ |r, n| r *= 10; r + n }).prime? } }
puts x
