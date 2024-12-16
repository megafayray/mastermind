require_relative 'lib/game' # rubocop:disable Style/FrozenStringLiteralComment
require_relative 'lib/computer'
require_relative 'lib/humanmaster'

class Mastermind # rubocop:disable Style/Documentation
  puts 'Welcome to Mastermind!'
  puts 'Press "M" to be the CodeMaster'
  puts 'Press "B" to be the CodeBreaker'

  @choice = gets.chomp.upcase

  if @choice == 'B'
    @codemaster = 'computer'
    Game.new.startup
  elsif @choice == 'M'
    @codemaster = 'human'
    Game.new.startup
  else
    puts 'Please try again, selecting "M" or "B"'
    @choice
  end

  attr_reader :choice
end

Mastermind.new
