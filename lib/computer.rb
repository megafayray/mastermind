class Computer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def generate_code
    @colours = %w[R O Y G B P] # rubocop says this is how to structure an array that only contains strings
    @code = []

    while @code.length < 4
      rando = rand(0..@colours.length - 1)
      @code.push(@colours[rando]) unless @code.include?(@colours[rando])
    end
    @code
  end

  def generate_possibilities
    @possibilities = @colours.combination(4).to_a
  end

  def guess
    @guess = @possibilities.sample
  end

  def update_possibilities
    @possibilities.delete(@guess)
  end

  attr_reader :code, :guess # rubocop:disable Lint/DuplicateMethods
end
