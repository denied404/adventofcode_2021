# down X increases your aim by X units.
# up X decreases your aim by X units.
# forward X does two things:
#   - It increases your horizontal position by X units.
#   - It increases your depth by your aim multiplied by X.
coords = [0, 0, 0]

COMMANDS = {
  forward: lambda do |v|
    coords[0] += v
    coords[1] += coords[2] * v
  end,
  down: -> (v) { coords[2] += v },
  up: -> (v) { coords[2] += -1 * v }
}.freeze

File.read('input.txt').split("\n").each do |i|
  cmd = i.split
  COMMANDS[cmd[0].to_sym].call(cmd[1].to_i)
end

puts "Horizontal: #{coords[0]} Depth: #{coords[1]} Aim: #{coords[2]}"
puts "Result: #{coords[0] * coords[1]}"
