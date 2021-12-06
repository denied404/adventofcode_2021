input = File.read('input.txt').split.map(&:to_i)

sums = []
input.each_cons(3) { |a, b, c| sums.push(a + b + c) }

increases = 0
sums.each_cons(2) { |i_prev, i_cur| increases += 1 if i_prev < i_cur }

puts "#{increases} increases"
