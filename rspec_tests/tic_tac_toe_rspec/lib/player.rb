class Player
  attr_accessor :name, :token, :player_moves
  def initialize(name, token)
    @score = 0
    @name = name
    @token = token
    @player_moves = []
  end

  def push_move
    self.player_moves.push((row_item_index+1)+3*row_index)
  end
end
