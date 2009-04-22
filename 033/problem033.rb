require 'mathn'

class String
  def -(s)
    sub(s, '')
  end
end

answer = 1
non10 = ->(n){n % 10 == 0}
11.upto(99).reject(&non10).each do |den|
  11.upto(den - 1).reject(&non10).each do |mol|
    d_s, m_s = den.to_s, mol.to_s
    (d_s.chars.to_a & m_s.chars.to_a).each do |n|
      if (mol / den) == ((m_s - n).to_i / (d_s - n).to_i)
        answer *= (mol / den)
      end
    end
  end
end

answer.denominator.display
