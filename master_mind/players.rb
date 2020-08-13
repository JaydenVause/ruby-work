class Player
  def initialize
    @code = []
    @player_choice = 0
  end
end

class Ai < Player
  attr_reader :code
  def initialize
    @code = generate_code
  end
protected
  def generate_code
    range = (1..4).to_a.shuffle
    return range
  end
end

class Human < Player
  def initialize
  end
end