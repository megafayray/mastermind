class Computer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  attr_reader :code, :guess, :possibilities

  def initialize
    @colours = %w[R O Y G B P]
  end

  def instructions
    puts "#{@code}" # debugging
    puts 'I am the codemaster. I have selected a secret code. Your job as the codebreaker is to guess my code within 12 turns. You can select from 6 colours:' # rubocop:disable Layout/LineLength
    puts 'Enter "r" for red, "o" for orange, "y" for yellow, etc'
    puts 'I will NEVER put duplicates or blanks in my code'
    puts ''
    puts 'Please enter your guess as a 4 digit code, then press enter'
  end

  def generate_code
    @code = []

    while @code.length < 4
      rando = rand(0..@colours.length - 1)
      @code.push(@colours[rando]) unless @code.include?(@colours[rando])
    end
    @code
  end

  def generate_possibilities
    @possibilities = @colours.permutation(4).to_a
    puts "Number of possible permutations: #{@possibilities.length}"
  end

  def guess # rubocop:disable Lint/DuplicateMethods
    @guess = @possibilities.sample
  end

  def update_possibilities
    @possibilities.delete(@guess)
  end
end
