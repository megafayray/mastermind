class Game # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def startup
    @turn_number = 1
    @computer = Computer.new
    @computer.generate_code

    puts "#{@computer.code}" # debugging
    puts 'I am the codemaster. I have selected a secret code. Your job as the codebreaker is to guess my code within 12 turns. You can select from 6 colours:' # rubocop:disable Layout/LineLength
    puts 'Enter "r" for red, "o" for orange, "y" for yellow, etc'
    puts 'I will NEVER put duplicates or blanks in my code'
    puts ''
    puts 'Please enter your guess as a 4 digit code, then press enter'

    guessing
  end

  def guessing
    @input = gets.chomp.upcase.split(//)
    puts "For turn number #{@turn_number}, your code was #{@input}"

    compare
  end

  def compare
    puts "Computer code is #{@computer.code}"
    if @computer.code == @input
      puts 'You guessed the secret code!'
    elsif @turn_number < 12
      @turn_number += 1
      feedback
      puts "Here is some feedback: #{@hints}. Try again!"
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
