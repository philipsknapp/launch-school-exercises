class Player
  attr_reader :current_guess, :guesses
  
  def initialize(guesses)
    @current_guess = nil
    @guesses = guesses
  end
  
  def guess
    guess = nil
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.to_i
      break if (1..100).cover?(guess)
      print "Invalid guess. "
    end
    self.current_guess = guess
    self.guesses -= 1
  end
  
  private
  
  attr_writer :guesses, :current_guess
end

class GuessingGame
  def play
    setup
    while player.guesses > 0
      display_guesses
      player.guess
      check_guess
      break if won
    end
    display_losing_message unless won
  end
  
  private
  
  attr_reader :number
  attr_accessor :guesses, :current_guess, :won, :player
  
  def setup
    @player = Player.new(7)
    @number = rand(100)
    @won = false
  end

  def display_guesses
    puts "You have #{player.guesses} guesses remaining."
  end
  
  def check_guess
    case player.current_guess <=> number
    when 1 then puts "Your guess is too high."
    when -1 then puts "Your guess is too low."
    when 0
      puts "That's the number!"
      puts
      puts "You won!"
      self.won = true
    end
  end
  
  def display_losing_message
    puts "You have no more guesses. You lost!"
  end
end

game = GuessingGame.new
game.play
game.play