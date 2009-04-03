def factorize(n)
  factors = Hash.new(0)
  i = 2
  while i < n
    if n % i == 0
      factors[i] += 1
      n /= i
    else
      i += 1
    end
  end
  factors[n] += 1
  return factors
end

def factors_num(n)
  factors = factorize(n)
  return 2 if factors.empty?
  return factors.values.map{|i| i + 1}.inject(:*)
end

def problem012()
  i = 1
  trialgle_num = 1
  loop do
    if 500 < factors_num(trialgle_num)
      return trialgle_num
    end
    i += 1
    trialgle_num += i
  end
end

problem012.display
