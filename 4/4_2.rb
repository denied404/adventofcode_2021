def has_winners?(board) has_winner_rows?(board) || has_winner_columns?(board)
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
boards_prev = []
last_num = 0
numbers.each do |num|
  puts "Current number drawn is #{num}"
  last_num = num
  boards = boards.map { |b| mark(b, num) }
  boards_prev = boards
  boards = boards.filter { |b| not has_winners?(b) }
  break if boards.length == 0
end

puts "Last winner board score is: #{winner_score(boards_prev[0], last_num)}"
