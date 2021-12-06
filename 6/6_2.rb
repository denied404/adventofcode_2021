DAYS = 256.freeze
FIRST_COOLDOWN = 2.freeze
INTERVAL = 7.freeze
CACHE = {}

# A common approach of using recursion with memoization
# Nothing spectacular, just works :)
def population(timer, day)
  return 1 if day == 0 
  return population(INTERVAL - 1, day - 1) + population(INTERVAL - 1 + FIRST_COOLDOWN, day - 1) if timer == 0
  return CACHE[timer - 1][day - 1] if CACHE[timer - 1] && CACHE[timer - 1][day - 1]

  CACHE[timer - 1] ||= {}
  CACHE[timer - 1][day - 1] ||= population(timer - 1, day - 1)

  return CACHE[timer - 1][day - 1] 
end

fishes = File.read('input.txt').split(',').map(&:to_i)
puts fishes.map { |f| population(f, DAYS) }.sum
