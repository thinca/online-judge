require 'mathn'

def factors_num(n)
  return n.prime_division.map{|i| i[1] + 1}.inject(:*)
end

def problem012()
  i = 1
  trialgle_num = 1
  loop do
    i += 1
    trialgle_num += i
    if 500 < factors_num(trialgle_num)
      return trialgle_num
    end
  end
end

problem012.display
