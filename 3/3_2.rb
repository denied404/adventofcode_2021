input = File.read('input.txt').split

o2, co2 = ['', '']
o2s, co2s = [input, input]

(0..input[0].length - 1).each do |i|
  ones = o2s.map { |inp| inp[i].to_i }.sum
  zeros = o2s.length - ones
  o2s = o2s.select { |g| g[i] == (ones >= zeros ? '1' : '0') }
  o2 = o2s[0] if o2s.length == 1
  
  ones = co2s.map { |inp| inp[i].to_i }.sum
  zeros = co2s.length - ones
  co2s = co2s.select { |g| g[i] == (zeros <= ones ? '0' : '1') }
  co2 = co2s[0] if co2s.length == 1
end

o2 = o2s[0] if o2 == ''
co2 = co2s[0] if co2 == ''

puts "o2 rate: #{o2} (#{o2.to_i(2)} in dec)"
puts "co2 rate: #{co2} (#{co2.to_i(2)} in dec)"
puts "power consumption: #{o2.to_i(2) * co2.to_i(2)}"
