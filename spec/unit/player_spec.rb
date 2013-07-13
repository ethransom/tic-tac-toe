require_relative '../../lib/player.rb'
require 'spec_helper'

include TicTacToe

describe Player do
  it "works" do
    Player.new :x
  end
end
