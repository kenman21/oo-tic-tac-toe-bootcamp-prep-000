class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end
  
  def move(user_input, token = "X")
    @board[@index] = token
  end
  
  def position_taken?
    @board[@index] != " " && @board[@index] != ""
  end
  
  def valid_move?
    @index.between?(0,8) && !position_taken?
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input_to_index(input)
    if valid_move?
      move(@index)
      display_board
    else
      turn(board)
    end
  end
  
  def turn_count(board)
    turn = 0 
    board.each do |cell|
      if cell == "X" || cell == "O"
        turn += 1
      end 
    end
    turn 
  end 

  def current_player(board)
    if turn_count(board) % 2 == 0 
      "X"
    else
      "O"
    end 
  end 
  
  def won?(board)
    WIN_COMBINATIONS.each do |wincombo|
      if board[wincombo[0]] == "X" && board[wincombo[1]] == "X" && board[wincombo[2]] == "X"
        return wincombo
      elsif board[wincombo[0]] == "O" && board[wincombo[1]] == "O" && board[wincombo[2]] == "O"
        return wincombo
      end 
    end
    return nil
  end 

  def full?(board)
    board.each do |value|
      if value == " "
        return false
      end 
    end
    return true
  end 

  def draw?(board)
    if won?(board)
      return false
    elsif full?(board)
      return true
    else 
      return false
    end 
  end 

  def over?(board)
    if draw?(board)
      return true
    elsif won?(board)
      return true
    else 
      false
    end 
  end
      
  def winner(board)
    if won?(board)
      return board[won?(board)[0]]
    else
      return nil
    end
  end  
  
  def play(board)
    while over?(board) == false
      turn(board)
      if won?(board)
        puts "Congratulations!"
      elsif draw?(board)
        puts "The game is a draw"
      end 
    end 
  end
  
end 