# Read input and compose an array of lines in format { x1:, y1:, x2:, y2: }
input = File.read('input.txt').split("\n")
lines = input.map do |i|
  points = i.split(' -> ').map { |p| p.split(',').map(&:to_i) }
  { x1: points[0][0], y1: points[0][1], x2: points[1][0], y2: points[1][1] }
end

map_dimension = lines.map { |l| [l[:x1], l[:x2], l[:y1], l[:y2]].max }.max + 1
map = Array.new(map_dimension) { Array.new(map_dimension, 0) }

def draw_line(map, line)
  if line[:x1] == line[:x2]
    ([line[:y1], line[:y2]].min..[line[:y1], line[:y2]].max).each do |j|
      map[line[:x1]][j] += 1
    end
  elsif line[:y1] == line[:y2]
    ([line[:x1], line[:x2]].min..[line[:x1], line[:x2]].max).each do |i|
      map[i][line[:y1]] += 1
    end
  end
  map
end

lines.each { |l| map = draw_line(map, l) }

puts map.map { |l| l.map { |p| p > 1 ? 1 : 0 }.sum }.sum

