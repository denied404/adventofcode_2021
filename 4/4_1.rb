def has_winners?(board)
  has_winner_rows?(board) || has_winner_columns?(board)
end

def has_winner_rows?(board)
  board.filter { |row| row.filter { |el| el == '#' }.length == row.length }.length > 0
end

def transpose(board)
  board_t = []
  (0..board.length - 1).each do |i|
    board_t.push(board.map { |r| r[i] })
  end
  board_t
end

def has_winner_columns?(board)
  has_winner_rows?(transpose(board))
end

def mark(board, number)
  board.map do |row|
    row.map { |el| el == number ? '#' : el }
  end
end

def winner_score(board, number)
  number * board.map { |row| row.map(&:to_i).sum }.sum
end

input = File.read('input.txt').split("\n\n")
numbers = input[0].split(',').map(&:to_i)
boards = input[1..].map do |b|
  b.split("\n").map do |row|
    row.split.map(&:to_i)
  end
end

winners = []
last_num = 0
numbers.each do |num|
  puts "Current number drawn is #{num}"
  last_num = num
  boards = boards.map { |b| mark(b, num) }
  winners = boards.filter { |b| has_winners?(b) }
  break if winners.length > 0
end

if winners.length > 0
  puts "Last number is #{last_num}"
  winners.each do |winner|
    puts "Winner"
    winner.each do |r|
      puts r.join(' ')
    end
  end
  puts "Winner score is #{winner_score(winners[0], last_num)}"
end
