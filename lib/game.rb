class Game # rubocop:disable Style/Documentation
  def initialize
    @turn_number = 1
    @computer = Computer.new
    @human = Human.new
  end

  def begin
    puts 'Welcome to Mastermind!'
    puts 'Press "M" to be the CodeMaster or Press "B" to be the CodeBreaker'

    @choice = gets.chomp.upcase

    if @choice == 'B'
      @codemaster = 'computer'
      @computer.generate_code
      @computer.instructions
      guessing
    elsif @choice == 'M'
      @codemaster = 'human'
      @computer.generate_possibilities
      @human.instructions
      run_it
    else
      puts 'Please try again, selecting "M" or "B"'
      @choice
    end
  end

  def guessing
    @input = gets.chomp.upcase.split(//)
    puts "For turn number #{@turn_number}, your code was #{@input}"

    compare
  end

  def run_it
    computer_guess_attempt while @turn_number < 13
  end

  def computer_guess_attempt
    guess = @computer.guess
    puts "Computer's guess on turn number #{@turn_number} is #{guess}"
    puts 'Debugging:'
    puts "Secret code: #{@human.secret_code}"
    puts "Computer's guess: #{guess}"
    if guess == @human.secret_code
      puts 'The computer guessed your code!'
    else
      @turn_number += 1
      @computer.update_possibilities
      if @turn_number < 13
        puts 'The computer will try again'
      else
        puts 'Gameover - the computer failed to guess the code within 12 turns.'
      end
    end
  end

  def compare
    if @computer.code == @input
      if @codemaster == 'computer'
        puts 'You guessed the secret code!'
      elsif @codemaster == 'human'
        puts 'The computer guessed your code!'
      end
    elsif @turn_number < 12
      @turn_number += 1
      feedback
      puts "Here is some feedback: #{@hints.sort}. Try again!"
      guessing
    else
      puts 'Gameover'
    end
  end

  def feedback
    @hints = []
    @computer.code.each_with_index do |computer_value, index|
      if computer_value == @input[index]
        @hints.push('black')
        # @hints.push("black: #{computer_value}, #{index}")
      elsif @input.include?(computer_value)
        @hints.push('white')
        # @hints.push("white: #{computer_value}, #{index}")
      end
    end
    @hints
  end
end
