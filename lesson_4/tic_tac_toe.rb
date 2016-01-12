# Tic Tac Toe game

require 'pry'

WINNING_COMBINATIONS = [[1, 2, 3], [1, 5, 9], [1, 4, 7], [2, 5, 8],
                        [3, 5, 7], [4, 5, 6], [7, 8, 9], [3, 6, 9]]
score = { player: 0, computer: 0, tie: 0 }
current_player = 'player'

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = ' ' }
  new_board
end

def draw_board(b) # board
  system 'clear'
  puts "
             |     |
          #{b[1]}  |  #{b[2]}  |  #{b[3]}
        _____|_____|_____
             |     |
          #{b[4]}  |  #{b[5]}  |  #{b[6]}
        _____|_____|_____
             |     |
          #{b[7]}  |  #{b[8]}  |  #{b[9]}
             |     |
"
end

def remaining_options(board)
  board.keys.select { |position| board[position] == ' ' }
end

def tally_score(winner, score)
  score[:player] += 1 if winner == 'Player'
  score[:computer] += 1 if winner == 'Computer'
  score[:tie] += 1 if winner == 'Tie'
end

def winner?(board)
  WINNING_COMBINATIONS.each do |combo|
    if board.values_at(combo[0], combo[1], combo[2]).count('X') == 3
      return 'Player'
    elsif board.values_at(combo[0], combo[1], combo[2]).count('O') == 3
      return 'Computer'
    elsif remaining_options(board) == []
      return 'Tie'
    end
  end
  nil
end

def display_result(winner, score)
  if winner == 'Player'
    puts "You won!"
  elsif winner == 'Computer'
    puts "You lost."
  elsif winner == 'Tie'
    puts "Tie."
  end

  puts "Player: #{score[:player]} -- Computer: #{score[:computer]} -- Ties: #{score[:tie]}"
end

def alternate_player(current_player)
  case current_player
  when 'player'
    current_player = 'computer'
  when 'computer'
    current_player = 'player'
  end
end

def get_player_choice!(board)
  player_choice = ''
  loop do
    puts "Please choose an unfilled position (1-9) to place your X:"
    player_choice = gets.chomp.to_i
    break if remaining_options(board).include?(player_choice)
  end

  board[player_choice] = 'X'
end

def check_computer_defense(board, combo)
  if board.values_at(*combo).count('X') == 2
    board.select { |k, v| combo.include?(k) && v == ' ' }.keys.first
  end
end

def check_computer_offense(board, combo)
  if board.values_at(*combo).count('O') == 2
    board.select { |k, v| combo.include?(k) && v == ' ' }.keys.first
  end
end

def get_computer_choice!(board)
  computer_choice = nil

  WINNING_COMBINATIONS.each do |combo|
    computer_choice = check_computer_offense(board, combo)
    break if computer_choice
  end

  if computer_choice.nil?
    WINNING_COMBINATIONS.each do |combo|
      computer_choice = check_computer_defense(board, combo)
      break if computer_choice
    end
  end

  computer_choice = 5 if board[5] == ' ' && computer_choice.nil?

  computer_choice = remaining_options(board).sample if computer_choice.nil?

  board[computer_choice] = 'O'
end

def get_choice!(board, current_player)
  case current_player
  when 'player'
    get_player_choice!(board)
  when 'computer'
    get_computer_choice!(board)
  end
end

loop do # continue loop
  board = initialize_board
  current_player = 'player'
  winner = nil

  loop do # game loop
    draw_board(board)
    get_choice!(board, current_player)
    current_player = alternate_player(current_player)
    winner = winner?(board)
    break if winner == 'Player' || winner == 'Computer' || winner == 'Tie'
  end

  tally_score(winner, score)
  draw_board(board)
  display_result(winner, score)

  puts "Do you want to play again? ('y' to continue)"
  continue = gets.chomp

  break if continue.downcase != 'y'
end

puts "Thanks for playing!"
