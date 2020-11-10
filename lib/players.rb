#!/usr/local/bin/ruby -w

class Player

  include INPUT

  attr_reader :game

  def initialize(game)
    @game = game
  end
end
