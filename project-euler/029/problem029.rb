require 'set'

a = (2..100).to_a
Set.new(a.product(a).map{ |n| n.inject(:**) }).size.display
