#!/usr/local/bin/ruby -w

class Display
  def initialize(word, guesses)
    @hung = 0
    @guesses = guesses
    
    @word = []
    @word_display = []
    word.split('').each do |i|
        @word << i
        @word_display << "_"
    end

    @guessed_letters = []
    
    @current_structure = @@structure.clone
    puts @current_structure

    print "\n #{@word_display}\n"
  end

  def update(letter, matches = 1)
    if letter == false
      puts "\nWrong!\n"
      hangman()
      @guessed_letters << matches if matches.is_a? String
    else
      puts "\nCorrect!\n"
      if matches.kind_of?(Array) ## more than one letter in word
        matches.each do |spot|
          @word_display[spot] = letter
        end
      else
        spot = @word.index(letter)
        @word_display[spot] = letter
      end
    end
    puts "\nGuessed letters: \n #{@guessed_letters}"
    puts @current_structure + "\n"
    print "\n\n #{@word_display.join}\n"
  end
  
  
  def hangman
    case @hung
    when 0
      @current_structure[39] = "0"
    when 1
      @current_structure[38] = "\\"
    when 2
      @current_structure[40] = "/"
    when 3
      @current_structure[54] = "|"
    when 4
      @current_structure[66] = "/"
    when 5
      @current_structure[68] = "\\"
    end
    @hung += 1
  end

  def load
    puts "\nGuessed letters: \n #{@guessed_letters}"
    puts @current_structure + "\n"
    print "\n\n #{@word_display.join}\n"
  end
  
  @@structure = 
  " 
      ______
      |    |
      |       
      |     
      |      
   ___|___"

end  


