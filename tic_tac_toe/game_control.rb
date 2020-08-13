class Game
  attr_reader :player1, :player2, :board, :current_player_turn
  include GameFunctions
  # self.create_player
  
  def initialize
    @score = 0
    @player1 = self.create_player
    @player2 = self.create_player
    @board = GameBoard.new
    @current_player_turn = 1
    # @player2 = self.create_player
  end
#  controling player turns and switching up the board
  def game_mech
    puts current_player_turn == 1 ? "#{player1.name} where would you like to place your mark" : "#{player2.name} where would you like to place your mark"
    player_move = gets.chomp.to_i
    if !board.board[0].include?(player_move) && !board.board[1].include?(player_move) && !board.board[2].include?(player_move)
      puts "error"
      game_mech
    else
      current_player_turn == 1? @current_player_turn = 2 :  @current_player_turn = 1 
      board.board.each_with_index do |row, row_index|
        board.board[row_index].each_with_index do |row_item, row_item_index|
          if row_item == player_move
             @board.board[row_index][row_item_index] = ( current_player_turn==1 ? player1.token : player2.token)

             winningcombonations =
              [[1, 2, 3], [4, 5 ,6], [7, 8, 9], [3, 6, 9], [8, 5, 2], [1, 4, 7] , [9, 5, 1], [7, 5, 3]]
          end
        end
      end
      self.display_board
      game_mech
    end


  end

end