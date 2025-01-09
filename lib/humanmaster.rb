class Human # rubocop:disable Style/FrozenStringLiteralComment,Style/Documentation
  attr_reader :secret_code

  def instructions
    puts 'You are the codemaster. I will attempt to guess your code within 12 turns. You can select from 6 colours:'
    puts 'Enter "r" for red, "o" for orange, "y" for yellow, etc'
    puts 'Do not put duplicates or blanks in your code'
    puts ''
    puts 'Please enter your secret four-digit code, then press enter'
    @secret_code = gets.chomp.upcase.split(//)
  end
end
