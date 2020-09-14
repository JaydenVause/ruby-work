require './lib/main.rb'

describe Game do
    game = Game.new
    it "has an instance of the Game class" do
        expect(game).to be_instance_of(Game)
    end

    it "has two players, both have tokens" do
        expect(game.player_1).to be_instance_of(Player)
        expect(game.player_2).to be_instance_of(Player)
        expect(game.player_1.token).to eql('$')
        expect(game.player_2.token).to eql('#')
    end 

    it "changes player turns on input" do
        expect(game.player_turn).to eql(1)
        game.player_input
        expect(game.player_turn).to eql(2)
    end

    it "expects to check if row is avalible" do
        expect(game.check_row(1)).to be(true)
    end

    it "expects that if the row is avalible then to put entry into board" do
        expect(game.check_row(1)).to be(true)
        game.player_turn == 1 ? token = "$" : token = "#"
        game.insert_token(1, token)
        expect(game.board[1][0]).to contain_exactly(token)
    end


    # it "expects that if the key is not valid then to re-enter user input" do
    # end

    it "expects that if the row is full then to re-enter user input" do
    end

    it "it checks if there is a horizontal win (4 connected horizontally" do
        game.player_turn == 1 ? token = "$" : token = "#"
        game.insert_token(1, token)
        game.insert_token(2, token)
        game.insert_token(3, token)
        game.insert_token(4, token)
        expect(game.check_horizontal(2,0)).to eql(true)
    end
    
    it "checks if there is a vertical win (4 connected vertically" do
        game = Game.new
        game.player_turn == 1 ? token = "$" : token = "#"
        game.insert_token(1, token)
        game.insert_token(1, token)
        game.insert_token(1, token)
        game.insert_token(1, token)
        p ''
        game.render_board
        
        expect(game.check_vertical(1,0)).to eql(true)
    end

    it "it checks if there is a diagonal win (4 connected diagonally" do
    end


end
