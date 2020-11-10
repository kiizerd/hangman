#!/usr/local/bin/ruby -w
require 'pry'
require_relative 'game.rb'

class Hangman

  include INPUT

  def initialize
    @games = []
    
    Intro.new

    @playing = game_ready()

    play()
  end
  
  def play
    i = 0
    while @playing
      if @playing == true
        @game = Game.new("game#{i}")
        
        @playing = continue?
        
        puts `clear`
      else
        @game = @playing
        @game.load
        
        @playing = continue?
      end
        
      i += 1
    end
  end
  
  def game_ready

    r = ready()

    case r
    when 1
      puts "..starting.."
      return true
    when 2
      save = choose_save()
      return save
    when 3
      puts "more info"
    when 4
      puts "goodbye"
      exit    
    end
  end

  def load(fname)
    puts '..loading..'
    file = File.open("./saves/#{fname}", 'r')
    unserialized_game = Marshal.load(file)
    file.close
    return unserialized_game
  end
end

Hangman.new
