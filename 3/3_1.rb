input = File.read('input.txt').split

gamma = ''
epsilon = ''

(0..input[0].length - 1).each do |i|
  zeros = 0
  input.each { |inp| zeros += 1 if inp[i] == '0' }
  if zeros < (input.length - zeros)
    gamma += '1'
    epsilon += '0'
  else
    gamma += '0'
    epsilon += '1'
  end
end

puts "gamma rate: #{gamma} (#{gamma.to_i(2)} in dec)"
puts "epsilon rate: #{epsilon} (#{epsilon.to_i(2)} in dec)"
puts "power consumption: #{gamma.to_i(2) * epsilon.to_i(2)}"
