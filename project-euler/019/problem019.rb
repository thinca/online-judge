require 'date'

class Date
  def step(limit, step = 1, method = :next_day)
    unless block_given?
      return to_enum(:step, limit, step, method)
    end
    da = self
    op = %w(- <= >=)[step <=> 0]
    while da.__send__(op, limit)
      yield da
      da = da.__send__(method, step)
    end
    self
  end
end

Date.new(1901, 1, 1).step(Date.new(2000, 12, 31), 1, :next_month).select{ |d| d.sunday? }.count.display
