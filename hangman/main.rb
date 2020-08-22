class Game

  def initialize
    @words = File.open("5desk.txt")
    @code = generate_word_array(@words).chomp.downcase.split("")
    @hint = Array.new(@code.length,"-")
    @guesses = 10
  end

  def run_game
    puts "player the rules of the game are within 10 rounds you must guess the word in the code, (displayed in the hints that are given based off your answers) if you dont do that within the given rounds then the game is over and you lose , be smart and use the hints given as much as possible goodluck!"
    while @guesses >= 0 do
      self.display_hint_ui
      self.does_include?(self.get_player_input)
      if @hint == @code
       return puts "Player you win congratulations!"
      end
    end
    puts "Game over better luck next time!"
  end

  # generate a random word from the list under the conditions
  def generate_word_array(word_file)
    entry = Array.new
    array_of_words = Array.new 
    rndm_select = Random.new
    selection = ''
    until selection.length > 5 && selection.length < 8 do 
      word_file.each { |word| array_of_words.push(word) }
      rndm_word_num = rndm_select.rand(array_of_words.length)
      selection = array_of_words[rndm_word_num]
    end
    print selection
    return selection
  end
# display hints and rounds
  def display_hint_ui
    print "#{@hint} You have #{@guesses} guesses left"
    puts " "
  end
# get player input to check if its in the code
  def get_player_input
    puts "player give an input of a-z"
    print "Player:"
    input = gets.chomp.to_s.downcase
    while !input.length == 1 || !('a'..'z').include?(input) do
      puts "Oops something went wrong check your input player!"
      print "Player:"
      input = gets.chomp.to_s.downcase 
    end
    return input
  end
# if the code has it change the hint
  def does_include?(player_input)
  
   @code.each_with_index do |letter, index|
      if letter == player_input 
        @hint[index] = letter
      end
    end
    if @code.include?(player_input)
    elsif !@code.include?(player_input)
      @guesses -= 1
    end
    # puts "found"
    # self.display_hint_ui
  end

end

game = Game.new
# game.display_hint_ui
# game.get_player_input
# game.does_include?(game.get_player_input)

game.run_game