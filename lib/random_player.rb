module TicTacToe
  # `RandomPlayer` randomly picks a move.
  # Obviously it isn't a difficult opponent. :)
  class RandomPlayer < Player
    def move! grid
      move = grid.moves.sample
      # puts "#{@symbol.to_s} moves to #{move.inspect}"
      grid.apply move, @symbol
      move
    end
  end
end