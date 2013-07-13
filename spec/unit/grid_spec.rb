require 'spec_helper'

describe TicTacToe::Grid do
  let (:grid) { TicTacToe::Grid.new }

  it "works as a data structure" do
    grid[1,2] = :bob
    grid[1,2].should eq :bob
  end

  it "initializes all values to `:blank`" do
    3.times do |i|
      3.times do |j|
        grid[i,j].should eq :blank
      end
    end
  end

  describe "#clone" do
    it "clones the grid, including table data" do
      new_grid = grid.clone

      new_grid.should eq grid
    end
  end

  describe "#at" do
    it "accepts an array, returning the same cell as #[]" do
      grid.at([1,2]).should eq grid[1,2]

      grid[1,2] = :x

      grid.at([1,2]).should eq :x
    end
  end

  describe "#inspect" do
    it "inspects the internal arrays" do
      grid[1,1] = :o
      grid.inspect.should eq "[[:blank, :blank, :blank], [:blank, :o, :blank], [:blank, :blank, :blank]]"
    end
  end

  describe "#moves" do
    let (:midgame_grid) do
      # |XXO|
      # | O |
      # |X  |
      grid[0,0] = :x
      grid[0,1] = :x
      grid[0,2] = :o
      grid[1,1] = :o
      grid[2,0] = :x

      grid
    end

    it "works correctly" do
      midgame_grid.moves.should eq [[1,0],[1,2],[2,1],[2,2]]
    end
  end

  describe "#won?" do
    let (:won_game) do
      # |XXO|
      # | O |
      # |O  |
      grid[0,0] = :x
      grid[0,1] = :x
      grid[0,2] = :o
      grid[1,1] = :o
      grid[2,0] = :o

      grid
    end

    let (:unwon_game) do
      # |  O|
      # | XO|
      # |X  |
      grid[0,2] = :o
      grid[1,1] = :x
      grid[1,2] = :o
      grid[2,1] = :x

      grid
    end

    it "detects when a player has won" do
      won_game.won?.should be_true
    end

    it "detects when a player has not won" do
      unwon_game.won?.should be_false
    end
  end

  describe "#stalemate?" do
    let (:endgame_grid) do
      grid.each! do
        [:x, :o].sample
      end
    end

    it "detects when the grid is full" do
      endgame_grid.stalemate?.should be_true
    end
  end
end
