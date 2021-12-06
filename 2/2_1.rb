coords = [0, 0]

COMMANDS = {
  forward: -> (v) { coords[0] += v },
  down: -> (v) { coords[1] += v },
  up: -> (v) { coords[1] += -1 * v }
}.freeze

File.read('input.txt').split("\n").each do |i|
  cmd = i.split
  COMMANDS[cmd[0].to_sym].call(cmd[1].to_i)
end

puts "Horizontal: #{coords[0]} Depth: #{coords[1]}"
puts "Result: #{coords[0] * coords[1]}"
