class GuessingGame
  def play
    setup
    while guesses > 0
      display_guesses
      player_guess
      check_guess
      break if won
      self.guesses -= 1
    end
    display_losing_message unless won
  end
  
  private
  
  attr_reader :number
  attr_accessor :guesses, :current_guess, :won
  
  def setup
    @guesses = 7
    @number = rand(100)
    @current_guess = nil
    @won = false
  end

  def display_guesses
    puts "You have #{guesses} guesses remaining."
  end
  
  def player_guess
    guess = nil
    loop do
      print "Enter a number between 1 and 100: "
      guess = gets.to_i
      break if (1..100).cover?(guess)
      print "Invalid guess. "
    end
    self.current_guess = guess
  end
  
  def check_guess
    case current_guess <=> number
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