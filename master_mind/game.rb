class Game
  attr_reader :code_maker, :code_breaker, :board 
  attr_accessor :rounds
  def initialize
    @code_maker = Ai.new
    @code_breaker = Human.new
    @board = Board.new
    @rounds = 7
  end

  def welcome_message
    puts "Welcome to Mastermind"
    puts ""
    puts "The object of MASTERMIND (r) is to guess a secret code consisting of a series of 4 colored pegs. Each guess results in feedback narrowing down the possibilities of the code:
    
    >> $$$$$$ will indicate correct answer in correct position

    >> ****** will indicate the answer is included in the code but incorect position

    >> '    ' and a blank space will indicate that it isnt included at all

    GOODLUCK PLAYER ! LETS BEGIN!

The winner is the player who solves his opponent's secret code with fewer guesses.This game will go for a total of 7 rounds!"
    puts "Enter a combonation of four numbers ranging from 1-4 seperating each with a comma"
    puts "Example :1,2,3,4"
  end

  def game
    code_maker_array = code_maker.code
    i = 0
    loop do 
    print "Player Combonation:"
    code_breaker_array = gets.chomp.split(",").map {|item| item.to_i}
      if code_breaker_array.length == 4
        check(code_maker_array, code_breaker_array)
        break
      else
        puts "Error please try again!"
      end
      i += 1
    end 
  end
  

  def check(code_maker_array, code_breaker_array)
    puts "This was your pick #{code_breaker_array.to_s}"
    result = []
    code_breaker_array.each_with_index do |code, index|
      print "|"
      if code == code_maker_array[index]
        # print "correct"
        print "$$$$$$"
      elsif code_maker_array.include?(code)
        # print "Included but not correct"
        print "******"
      else
        # print "incorrect"
        print "      "
      end
    end
    return if win(code_breaker_array,code_maker_array) == true
    @rounds -= 1
    puts ""
    puts "only #{rounds} more rounds to go !"
    rounds >= 1 ? self.game : (puts "YOU LOSE SORRY")
  end

  def win(code_breaker_array, code_maker_array)
    if code_breaker_array == code_maker_array
      puts ""
      puts "WOW YOU WON!!!! Congrats"
      true
    else
      false
    end
  end
end