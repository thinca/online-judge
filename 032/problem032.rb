class Array
  def to_d
    inject(0) do |r, d|
      r *= 10
      r += d
    end
  end
end

answer = 0
nums = (1..9).to_a

# a * b = c
# The digits of c must be 4.
nums.permutation(4) do |rhs|
  c = rhs.to_d
  (nums - rhs).permutation do |lhs|
    1.upto(4) do |n|
      a = lhs.slice(0, n).to_d
      b = lhs.slice(n, lhs.length - n).to_d
      if a * b == c
        answer += c
        puts '%d * %d = %d' % [a, b, c]
        c = nil
        break
      end
    end
    break if c == nil
  end
end
answer.display
