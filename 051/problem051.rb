require 'prime'

def patterns(s, d = nil) # '15259' => ['*5259', '1*259', '1*2*9', '15*59', '152*9', '1525*']
  return [] if s.empty?
  x, xs = s[0], s[1..-1]
  b = patterns(xs, d || x)
  return (d ? b : patterns(xs, d)).map{ |r| x + r } + (d == x || !d ? b.push(xs).map{ |r| '*' + r } : [])
end

stat = Hash.new { |hash, key| hash[key] = [] }
Prime.each do |pr|
  patterns(pr.to_s).each do |pat|
    if 8 <= stat[pat].push(pr).length
      p stat[pat].first
      exit
    end
  end
end
