#!/usr/local/bin/ruby -w

module INPUT

  @@yes_no = /^(y|n)$/
  @@letter = /^[a-z]$/
  @@new_load = /^(new|load|n|l)$/

  def guess
    puts "Make your guess! (A - Z) or..",
         "Attempt to guess the word (word) or..",
         "Save your game (save)"
    response = gets.chomp.downcase
    while !response.match(@@letter) && response != ('save') && response != ('word')
      puts "\n Error, try again\n"
      response = gets.chomp.downcase
    end
    if response == 'word'
      guess_word()
    elsif response == 'save'
      self.game.save
      self.game.get_guess
    else
      guess_letter(response)
    end
  end

  def guess_letter(letter)
    return letter
  end

  def guess_word
    puts "Enter your guess for the whole word"
    response = gets.chomp.downcase
    puts 'sorry doesnt work yet'
  end

  def ready
    print "\nAre you ready? (1 / 2 / 3 / 4)\n\n", 
          "\n[1] - Start game",
          "\n[2] - Load Game",
          "\n[3] - More information", 
          "\n[4] - Exit\n\n"
    response = gets.chomp.to_i
    while response > 4 || response < 1
      puts "\n Error, try again\n"
      response = gets.chomp.to_i
    end
    response
  end

  def choose_save
    puts "Which save file would you like to load?"
    saves_dir = Dir.new('./saves/')
    saves = []
    saves_dir.each do |f|
      if f.length > 2
        saves << f
      end
    end
    saves.each { |i| p i}
    response = gets.chomp.downcase
    while !saves.include? response
      puts "\n Error, try again\n"
      response = gets.chomp.downcase
    end
    load(response)
  end

  def difficulty
    #response = gets.chomp.to_i
    #while response > 4 || response < 1
    #  puts "\n Error, try again\n"
    #  response = gets.chomp.to_i
    #end
    6
  end

  def continue?
    puts "Would you like to play again? (Y / N)"
    response = gets.chomp.downcase
    while !response.match @@yes_no
      puts "\n Error, Try Again\n."
      response = gets.chomp.downcase
    end
    if response == 'y'
      true
    else
      false
    end
  end
end
