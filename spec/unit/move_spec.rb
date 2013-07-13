require 'spec_helper'

include TicTacToe

describe Move do
  it "initializes with coordinates" do
    move = Move.new [0,0]
    move.coordinate.should eq [0,0]
  end

  describe "#row & #column" do
    it "properly return row and column of coordinate" do
      move = Move.new [2,0]
      move.row.should eq 2
      move.column.should eq 0
    end
  end

  describe "#neighbor_coords" do
    it "properly returns neighbors" do
      move = Move.new [1,1]
      grid = Grid.from_array([:x, :x,     :x,
                              :x, :blank, :x,
                              :x, :x,     :x])
      new_grid = Grid.new
      move.neighbor_coords.each do |coordinate|
        new_grid.apply coordinate, :x
      end

      grid.should eq new_grid
    end
  end
end