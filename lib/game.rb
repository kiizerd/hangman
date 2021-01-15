#!/usr/local/bin/ruby -w

require_relative 'input.rb'
require_relative 'display.rb'
require_relative 'intro.rb'
require_relative 'players.rb'
require_relative 'save_load.rb'

## Limit random word length
## Save and load game

class Game

  include INPUT

  attr_reader :name, :player

  def initialize(name)
    @name = name
    @word = get_word
    @wordAry = @word.chars
    @guesses = difficulty
    @guessed = []
    @remaining = @word.length
    @player = Player.new(self)
    @display = Display.new(@word, @guesses)
    play_game
  end

  def get_word
    dictionary = File.readlines("dictionary.txt")
    word = dictionary[rand(dictionary.count)]
    while word.length > 7
      word = dictionary[rand(dictionary.count)]
    end
    arr = []
    word.split('').each do |i|
      unless i == "\n" || i == "\r"
        arr << i
      end
    end
    word = arr.join.downcase
  end

  def get_guess
    puts "\n#{@guesses} guesses remaining\n"
    @player.guess
  end

  def feedback(letter)
    while @guessed.include? letter
        puts "Error, letter already entered. Try again"
        letter = gets.chomp
    end
    if @wordAry.include? letter
        if @wordAry.count(letter) > 1
            matches = @wordAry.map.with_index do |i, idx|
                idx if i == letter
            end.compact
            @display.update(letter, matches)
            @remaining -= matches.length
        else  
            @display.update(letter)
            @wordAry.delete(letter)
            @remaining -= 1
        end
    else
        @display.update(false, letter)
        @guesses -= 1
    end    
    @guessed << letter
  end
  
  def play_game
    while @guesses > 0
      guess = get_guess
      feedback(guess)
      if @remaining == 0
        win()
        break
      end
    end
    puts "The word was: \n #{@word}"
  end
  
  def win
    puts "You win!! You guessed the random word! You are the best!!"
  end

  def save
    puts '..saving..'
    time = Time.now
    save_time = "#{time.month}#{time.day}"
    unless Dir.exists?('./saves')
      Dir.mkdir('./saves')
    end
    save_file = File.open("./saves/#{save_time}.txt", 'w')
    serialized_object = Marshal.dump(self)
    save_file.write serialized_object
    save_file.close
  end

  def load
    puts 'loaded'
    @display.load
    play_game()
  end
end
