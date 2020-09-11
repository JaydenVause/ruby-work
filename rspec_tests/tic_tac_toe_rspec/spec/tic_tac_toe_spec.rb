require './lib/main.rb'

describe Game do
    it "check #winning HORIZONTAL for O player" do
    game = Game.new
    puts(  print game.game_board.board[0].each_with_index{|col, idx| game.game_board.board[0][idx] = "X"})
    game.player1.token = 'X'
    expect(game.winning_horizontal).to eql(true)
    end

    it "check #winning DIAGONAL for O player" do
    game = Game.new
        game.game_board.board[0][0] = 'X'
        game.game_board.board[1][1] = 'X'
        game.game_board.board[2][2] = 'X'
        print game.game_board.board
        game.player1.token = 'X'
        expect(game.winning_diagonal).to eql(true)
    end

    it "check #winning VERTICAL for O player" do
    game = Game.new
        game.game_board.board[0][2] = 'X'
        game.game_board.board[1][2] = 'X'
        game.game_board.board[2][2] = 'X'
        print game.game_board.board
        game.player1.token = 'X'
        expect(game.winning_vertical).to eql(true)
    end
end