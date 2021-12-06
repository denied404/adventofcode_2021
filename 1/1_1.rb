input = File.read('input.txt').split.map(&:to_i)
increases = 0
input.each_cons(2) { |i_prev, i_cur| increases += 1 if i_prev < i_cur }
puts "#{increases} increases"
