class Game
  attr_reader :player1, :player2, :game_board, :current_player_turn
  include GameFunctions
  # self.create_player
  
  def initialize
    
    @player1 = self.create_player
    @player2 = self.create_player
    @game_board = GameBoard.new
    @current_player_turn = 1
    # @player2 = self.create_player
  end

  
#  controling player turns and switching up the board
  def game_mech

    puts current_player_turn == 1 ? "#{player1.name} where would you like to place your mark" : "#{player2.name} where would you like to place your mark"
    player_move = gets.chomp.to_i
    # if the board cant find the position re run function
    if !game_board.board[0].include?(player_move) && !game_board.board[1].include?(player_move) && !game_board.board[2].include?(player_move)
      puts "error"
      game_mech
    else
      # if it finds the position go through the items in board and change it to the player mark
      
      game_board.board.each_with_index do |row, row_index|
        game_board.board[row_index].each_with_index do |row_item, row_item_index|
          if row_item == player_move
             @game_board.board[row_index][row_item_index] = ( current_player_turn==1 ? player1.token : player2.token)
                if winning_horizontal || winning_diagonal || winning_vertical
                    current_player_turn == 1 ? winner = @player1 : winner = @player2
                     return puts "Congrats #{winner.name} You have won!" 
                end

                if empty?
                 return puts "GAME IS OVER IT IS A DRAW!"
                end
             
          end
          
        end
      end
      current_player_turn == 1? @current_player_turn = 2 :  @current_player_turn = 1 
      self.display_board
      # puts @game_board.check_horizontal
      game_mech
    end
  end
  def empty?
    @game_board.board.all? do |row|
            row.none?(Integer)
    end
  end

  def winning_horizontal
      check_horizontal.any? do |horiz|
        horiz.all? do |item| 
        if current_player_turn == 1
          item == @player1.token
        else 
          item == @player2.token
        end
      end
    end
  end
    def winning_vertical
      check_vertical.any? do |vertical|
        vertical.all? do |item| 
        if current_player_turn == 1
          item == @player1.token
        else 
          item == @player2.token
        end
      end
    end
  end
    def winning_diagonal
      check_diagonal.any? do |diagonal|
        diagonal.all? do |item| 
        if current_player_turn == 1
          item == @player1.token
        else 
          item == @player2.token
        end
      end
    end
  end
  

  def check_horizontal
    @game_board.board
  end

  def check_vertical
    [[@game_board.board[0][0],@game_board.board[1][0],@game_board.board[2][0]],[@game_board.board[0][1],@game_board.board[1][1],@game_board.board[2][1]],[@game_board.board[0][2],@game_board.board[1][2],@game_board.board[2][2]]]
  end

  def check_diagonal
    [[@game_board.board[0][0],@game_board.board[1][1],@game_board.board[2][2]],[@game_board.board[0][2],@game_board.board[1][1],@game_board.board[2][0]]]
  end

end