class Game
  attr_reader :player_1, :player_2, :player_turn, :board
  def initialize
    @player_1 = Player.new("$")
    @player_2 = Player.new("#")
    @player_turn = 1
    @board = [
      [[], [], [], [], [], [], []],
      [[], [], [], [], [], [], []],
      [[], [], [], [], [], [], []],
      [[], [], [], [], [], [], []],
      [[], [], [], [], [], [], []],
      [[], [], [], [], [], [], []]
    ]
  end

  def player_input
    self.render_board
    puts ""
    puts "enter a number"
    player_input = gets.chomp.to_i
    @player_turn == 1 ? @player_turn = 2 : @player_turn = 1
    return player_input
  end

  def check_row(n)
    self.board.each do |row|
      row.each_with_index do |col, c_idx|
        if col != nil && c_idx == row.length
          return false
        end
      end
    end
    return true
  end

  def insert_token(n, token)
    @board[n].each_with_index do |col,idx|
      if col.empty?
        @board[n][idx] << token
        return [n,idx]
      end
    end
  end

  def render_board
    @board.each do |row|
      pp 's'
     row.each do |col|
        if col.empty?
          print '| |'
        else
          print "|#{col[0]}|"
        end
      end
    end

  end
  

  def check_horizontal(n, idx, visited=[], key = @board[n][idx])
    return if visited.include?(n)
    visited << n 
    
    print visited
    if @board[n-1]
      if @board[n-1][idx] == key
        check_horizontal(n-1, idx, visited, key)
      end
    end   
    if @board[n+1]
      if @board[n+1][idx] == key
        check_horizontal(n+1, idx, visited, key)    
      end
    end

    return true if visited.length == 4
  end
  
  def check_vertical(n, idx, visited=[], key = @board[n][idx])
    return if visited.include?(idx)
    visited << idx
   
    if @board[n][idx-1]
      if @board[n][idx-1] == @board[n][idx]
        check_vertical(n, idx-1, visited, key = @board[n][idx])
      end
    end
    if @board[n][idx+1]
      if @board[n][idx+1] == @board[n][idx]
        check_vertical(n, idx+1, visited, key = @board[n][idx])
      end
    end
    return true if visited.length == 4
  end

end #end of class

class Player
  attr_reader :token
  def initialize(token)
    @token = token    
  end
end

game = Game.new
game_over = false
while game_over == false 
  game.player_turn == 1 ? player_token = game.player_1.token : player_token =  game.player_2.token
  puts ""
  input = game.player_input
  x = game.insert_token(input, player_token)
  check_horiz = game.check_horizontal(x[0], x[1])
  check_vertical = game.check_vertical(x[0], x[1])
  if check_horiz == true
    print "game over"
    game_over = true
  elsif check_vertical == true
    print "game over"
    game_over = true
  else
  end
end
