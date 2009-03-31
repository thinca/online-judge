def sum_of_natural_number(n)
  return n * (n + 1) / 2
end

def arithmetic_series(d, max)
  return d * sum_of_natural_number(max / d)
end

def problem001(n)
  return arithmetic_series(3, n) + arithmetic_series(5, n) \
    - arithmetic_series(15, n)
end

problem001(999).display
