module GameFunctions
  def welcome_message
    puts "Welcome to tic, tac, toe"
    puts "this is our game board! You will take turn's giving a value 1-9 until a player gets three in a row wether it be acoross/down/diagonal"
    puts "---------------------"
    puts "OKAY! #{player1.name} & #{player2.name} let's begin!"
  end

  def create_player
    puts "player give me a name:"
    player_name = gets.chomp.to_s
    puts "player give me your token"
    player_token = gets.chomp.to_s
    Player.new(player_name, player_token)
  end

  def display_board
    puts (print "#{game_board.board[0][0]} | #{game_board.board[0][1]} | #{game_board.board[0][2]}")
    puts "----------"
    puts (print "#{game_board.board[1][0]} | #{game_board.board[1][1]} | #{game_board.board[1][2]}")
    puts "----------"
    puts (print "#{game_board.board[2][0]} | #{game_board.board[2][1]} | #{game_board.board[2][2]}")
  end

  
end

