crabs = File.read('input.txt').split(',').map(&:to_i)

min = crabs.min
max = crabs.max

min_fuel = -1
min_i = -1

(min..max).each do |i|
  fuel = crabs.map { |c| (c - i).abs }.sum
  if fuel < min_fuel || min_fuel == -1
    min_fuel = fuel
    min_i = i
  end
end

puts "Minimum fuel is #{min_fuel} at position #{min_i}"
