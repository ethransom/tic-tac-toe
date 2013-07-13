require_relative "lib/game.rb"
require_relative "lib/grid.rb"
require_relative "lib/player.rb"
require_relative "lib/human_player.rb"
require_relative "lib/smart_player.rb"
require_relative "lib/learning_player.rb"
require_relative "lib/move.rb"

include TicTacToe

joshua = LearningPlayer.new :o

100.times do
  game = Game.new RandomPlayer.new(:x), joshua
  game.play!
  joshua.end_game game.winner == joshua
end



# test `neighbor_coords`
# grid = Grid.new
# grid.moves.each do |move|
#   move = Move.new(move)
#   puts move.neighbor_coords.inspect
  
#   g = Grid.new
#   move.neighbor_coords.each do |coord|
#     g.apply coord
#   end

#   g.pretty_print
# end

# g = Grid.new
# g[0,0] = :x
# g[0,1] = :x
# g[0,2] = :o
# g.pretty_print

# puts g.won?

# printing possible wins

# # diagonals first
# possible_wins = [
# 	[[0,0],[1,1],[2,2]],
# 	[[2,0],[1,1],[0,2]],
# ]

# # horizontals
# possible_wins.concat([0,1,2].collect do |i|
# 	[[i,0],[i,1],[i,2]]
# end)

# # verticals
# possible_wins.concat([0,1,2].collect do |i|
# 	[[0,i],[1,i],[2,i]]
# end)


# possible_wins.each do |combination|
#   g = Grid.new

#   combination.each do |coordinate|
#     g[coordinate[0],coordinate[1]] = :x
#   end

#   g.pretty_print
#   puts ""
# end
