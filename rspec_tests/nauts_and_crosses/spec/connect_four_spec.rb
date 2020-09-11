require './lib/main.rb'

describe Game do
    it "make a game class of connect four" do
        game = Game.new
        expect(game).to be_kind_of(Game)
    end
end

describe Board do
    it "make a graph class of connect four" do
        board = Board.new
        expect(board).to be_kind_of(Board)
    end

    it "populate graph with rows of nodes" do
        board = Board.new
        expect(board.graph.length).to eql(42)
    end

    it "find node" do
        
    end
end

describe Player do
    it "make a Player class of connect four" do
        player = Player.new('$')
        expect(player).to be_kind_of(Player)
    end
end

describe Node do
    it "make a Node class of connect four" do
        node = Node.new('%')
        expect(node).to be_kind_of(Node)
    end
end

