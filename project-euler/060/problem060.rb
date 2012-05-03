require 'prime'

TARGET = 5
N = TARGET - 2

def full_set(store, set, n)
  n == 0 || set.map{ |s| [s, set & store[s]] }.find{ |s| n <= s[1].size && full_set(store, s[1], n - 1) }
end

store = Hash.new

Prime.each do |n|
  s = n.to_s

  f = store[s] = store.keys.select{ |e| (e + s).to_i.prime? && (s + e).to_i.prime? }

  if N < f.size
    set = full_set(store, f, N)
    if set
      puts(([set[0], s] + set[1]).map{ |e| e.to_i }.inject(:+))
      exit
    end
  end
end
