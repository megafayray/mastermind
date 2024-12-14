class Computer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def generate_code
    colours = %w[R O Y G B P] # rubocop says this is how to structure an array that only contains strings
    @code = []

    while @code.length < 4
      rando = rand(0..colours.length - 1)
      @code.push(colours[rando]) unless @code.include?(colours[rando])
    end
    @code
  end

  attr_reader :code
end
