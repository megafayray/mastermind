class Computer # rubocop:disable Style/Documentation,Style/FrozenStringLiteralComment
  def generate_code
    colours = %w[R O Y G B P]
    # Instance variables can be accessed by other methods in the same class,
    # or through getter methods if you want to provide access to other classes.
    @code = []

    while @code.length < 4
      rando = rand(0..colours.length - 1)
      @code.push(colours[rando])
    end
    @code
  end

  attr_reader :code
end
