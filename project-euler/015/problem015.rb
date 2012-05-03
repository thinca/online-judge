class Integer
  def !(to = 1)
    self.downto(to).inject(:*)
  end
  def combination(m)
    self.!(self - m + 1) / m.!
  end
end

(20 + 20).combination(20).display
