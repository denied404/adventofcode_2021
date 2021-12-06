def process(fishes)
  new_fishes = []
  fishes.map do |timer|
    if timer == 0
      new_fishes.push(8)
      6
    else
      timer - 1 
    end
  end + new_fishes
end

fishes = File.read('input.txt').split(',').map(&:to_i)

TICKS = 80

(1..TICKS).each do |day|
  fishes = process(fishes)
end

puts "There's #{fishes.length} fishes"
