class Player
    def initialize(place_holder)
      @place_holder = place_holder
    end
  end
  
  class Game
    attr_accessor :board
    def initialize
      @player_1 = Player.new('%')
      @player_2 = Player.new('$')
      @board = Board.new
      @visited = []
    end
  
    def player_move(n)
      placement = nil
      self.board.graph.each do |node|
        if node.value[1] == n && !@visited.include?(node.value)
          placement = node
        end
      end
      if placement == nil
      else
        @visited << placement.value
        placement.place_holder = '&'
        print @visited
      end
    end
  end
  
  class Board
    attr_accessor :graph
    def initialize
      @y_height = 6
      @x_width = 7
      @graph = generate_graph(@y_height, @x_width)
    end
  
    def generate_graph(y, x)
      graph = Array.new
      y.times do |y_i|
        x.times do |x_i|
          graph << Node.new([y_i,x_i])
        end
      end
      return graph
    end
  
    def to_s
      self.graph.each do |node|
        
        value = node.value[0]*7 + node.value[1]
        if value % 7 == 0
          puts ""
          if node.place_holder == nil
            print node.value
          else
            print "[  #{node.place_holder}  ]"
          end
        else
          if node.place_holder == nil
            print node.value
          else
            print "[  #{node.place_holder}  ]"
          end
        end
      end
  
    end
  
  end
  
  class Node
    attr_accessor :value, :place_holder
    def initialize(value)
      @value = value 
      @place_holder = nil
      @edges= [
        [1,0],
        [1,-1],
        [0,-1],
        [-1,-1],
        [-1,0],
        [-1,1],
        [0,1],
        [1,1]
      ]
    end
  end
  
  game = Game.new
  running = true
  
#   puts 'players take turns until the game is over putting their chip into the board until one player manages to get 4 chips in a row wether it be all diagonal, horizontal or vertical'
#   while running == true
#     game.board.to_s
#     puts ''
#     print "   0     1     2     3     4     5     6"
#     puts ""
#     puts "player where would you like to put your chip"
#     player_choice = gets.chomp.to_i
#     game.player_move(player_choice)
#   end
#   # display board
  
  