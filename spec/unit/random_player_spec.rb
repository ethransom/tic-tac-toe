require 'spec_helper'

include TicTacToe

describe RandomPlayer do
  it "works" do
    RandomPlayer.new :x
  end

  describe "#move" do
    it "returns a move" do
      player = RandomPlayer.new :x
      player.move!(Grid.new).should be_an Array
    end
  end
end
