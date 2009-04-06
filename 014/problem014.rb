class Problem014
  def initialize
    @answers = {1 => 1}
  end
  def collatz_len(n)
    @answers[n] = (n.even? ? collatz_len(n / 2) : collatz_len(n * 3 + 1)) + 1 if @answers[n] == nil
    return @answers[n]
  end
end
p14 = Problem014.new
c = (1..1000000).map{ |i| p14.collatz_len(i) }
(c.index(c.max) + 1).display
