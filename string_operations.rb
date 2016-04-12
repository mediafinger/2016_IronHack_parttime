class StringOperations
  def show_menu
    puts "Please enter a sentence:"
    input = gets.chomp

    puts "Please select what to do with it:"
    puts "A) word count"
    puts "B) letter count"
    puts "C) reverse string"
    puts "D) to lowercase"
    puts "E) to uppercase"

    selection = gets.chomp.upcase

    case selection
    when "A"
      count_words(input)
    when "B"
      count_characters(input)
    when "C"
      reverse(input)
    when "D"
      downcase(input)
    when "E"
      uppercase(input)
    end

    # always display the menu again
    show_menu
  end

  def count_words(input)
    puts "This includes #{input.split(' ').count} words."
  end

  def count_characters(input)
    puts "This includes #{input.length} characters."
  end

  def reverse(input)
    puts input.reverse
  end

  def downcase(input)
    puts input.downcase
  end

  def uppercase(input)
    puts input.upcase
  end
end
