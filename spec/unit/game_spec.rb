require 'spec_helper'

include TicTacToe

describe Game do
  it "works" do
    Game.new
  end

  it "can play a game" do
    game = Game.new
    game.play!
  end
end
