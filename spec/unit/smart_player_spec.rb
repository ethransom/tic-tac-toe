require 'spec_helper'

include TicTacToe

describe SmartPlayer do
  it "works" do
    SmartPlayer.new :x
  end

  describe "algorithm" do
    def move grid, symbol=:x
      player = SmartPlayer.new symbol
      grid.apply(player.move(grid), player.symbol)
      grid
    end

    it "prefers the middle" do
      grid = move Grid.new
      grid[1,1].should eq :x
    end

    it "wins if given the chance" do
      grid = Grid.from_array([:blank, :blank, :blank,
                              :blank, :x,     :o,    
                              :blank, :x,     :blank])
      move grid
      grid.won?.should be_true
      grid[0,1].should eq :x
    end

    it "blocks if opponent is about to win" do
      grid = Grid.from_array([:blank, :blank, :blank,
                              :blank, :x,     :o,    
                              :blank, :x,     :blank])
      move grid, :o
      grid.won?.should be_false
      grid[0,1].should eq :o
    end
  end
end
