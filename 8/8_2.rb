require 'byebug'
input = File.read('input.txt').split("\n").map do |inp| x = inp.split('|').map(&:strip).map(&:split)
  { digits: x[0].map{ |s| s.chars.sort.join }, output: x[1].map{ |s| s.chars.sort.join } }
end

def substract(target, sub)
  return "" if sub.length >= target.length
  target.chars.select { |c| not sub.chars.include?(c) }.join
end

def include?(target, sub)
  sub.chars.select { |c| target.include?(c) }.length == sub.length
end

# First, we identify unique digits: 1 contains 2 segments, 7 contains 3, 4 contains 4 and 8 contains 7
# Then, 3 contains the same segments as 1 plus three different segments (the only one with this property)
# Then, 9 is basically 3 plus one more segment
# Then, 6 has the same 6 digits as 9 but it is not equal to 9 and does not contain "one" as a substring
# Then, 5 is 9 minus one segment and it does not equal three
# Then, 2 contains 5 segments and it is not equal to three and five
# Then, 0 is 8 minus one segment and is not equal to nine and six
def digits_map(digits)
  out = {}
  one = digits.select { |d| d.length == 2 }.first
  four = digits.select { |d| d.length == 4 }.first
  seven = digits.select { |d| d.length == 3 }.first
  eight = digits.select { |d| d.length == 7 }.first
  three = digits.select { |d| substract(d, one).length == 3 && include?(d, one) }.first
  nine = digits.select { |d| substract(d, three).length == 1 && include?(d, three) }.first
  six = digits.select { |d| d.length == 6 && d != nine && !include?(d, one)}.first
  five = digits.select { |d| substract(nine, d).length == 1 && d != three }.first
  two = digits.select { |d| d.length == 5 && d != three && d != five }.first
  zero = digits.select { |d| substract(eight, d).length == 1 && include?(eight, d) && d != nine && d != six }.first

  out[one] = '1'
  out[two] = '2'
  out[three] = '3'
  out[four] = '4'
  out[five] = '5'
  out[six] = '6'
  out[seven] = '7'
  out[eight] = '8'
  out[nine] = '9'
  out[zero] = '0'

  out
end

sum = 0
input.each do |i|
  dmap = digits_map(i[:digits])
  sum += i[:output].map { |z| dmap[z] }.join.to_i
end

puts sum
