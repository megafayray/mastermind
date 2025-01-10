class Human # rubocop:disable Style/FrozenStringLiteralComment,Style/Documentation
  attr_reader :secret_code

  def instructions
    puts 'You are the codemaster. I will attempt to guess your code within 12 turns. You can select from 6 colours:'
    puts 'Enter "r" for red, "o" for orange, "y" for yellow, etc'
    puts 'Do not put duplicates or blanks in your code'
    puts ''
    puts 'Please enter your secret four-digit code, then press enter'
    @secret_code = []
    until @secret_code.uniq.length == 4
      input = gets.chomp.upcase

      if input.include?(" ")
        puts "Your code cannot include spaces - try again!"
        next
      end

      @secret_code = input.split(//)

      if @secret_code.length != 4
        puts "Your code needs to be four (4) digits long - try again!"
        next
      end

      if @secret_code.uniq.length != 4
        puts "Your code cannot contain duplicates - try again!"
        next
      end
    end
  end
end
