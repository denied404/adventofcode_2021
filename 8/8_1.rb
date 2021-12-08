input = File.read('input.txt').split("\n").map do |inp|
  x = inp.split('|').map(&:strip).map(&:split)
  { digits: x[0], output: x[1] }
end
puts input.map { |i| i[:output].select { |o| [2, 3, 4, 7].include? o.length }.length }.sum
