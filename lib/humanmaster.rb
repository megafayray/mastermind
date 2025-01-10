class Human # rubocop:disable Style/FrozenStringLiteralComment,Style/Documentation
  attr_reader :secret_code

  def instructions
    puts 'You are the codemaster. I will attempt to guess your code within 12 turns. You can select from 6 colours:'
    puts 'Enter "r" for red, "o" for orange, "y" for yellow, etc'
    puts 'Do not put duplicates or blanks in your code'
    puts ''
    puts 'Please enter your secret four-digit code, then press enter'
    @secret_code = []
    @colours = %w[R O Y G B P]
    until @secret_code.uniq.length == 4 && all_valid_colours?
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

      if !all_valid_colours?
        puts "Your code contains invalid colours - try again!"
        next
      end

    end
  end

  private #using this because this helper method is only to be available internally, and cannot be called outside of the Human class
  #could do the same with the length and uniq length checks as well

  def all_valid_colours?
    @secret_code.all? { |char| @colours.include?(char) }
  end

end
