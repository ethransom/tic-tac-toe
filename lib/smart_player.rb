module TicTacToe
  # `SmartPlayer` will intelligently choose the best move possible.
  # With luck, pitting `SmartPlayer`s against each other will result
  # in a War Games style situation! :D
  class SmartPlayer < Player
    # prevents recursive stimulatory players from recursing themselves.
    # could allow for `SmartPlayer` to strategize about entire games in advance.
    attr_accessor :recursive

    def initialize symbol
      @recursive = false
      super
    end

    def move!(grid)
      moves = grid.moves.shuffle!

      ranked_moves = moves.collect do |move|
        rank = rank_move move, grid

        {move: move, rank: rank}
      end

      ranked_moves.sort_by! { |combo| combo[:rank] }

      # puts ranked_moves.inspect unless @recursive
      move = ranked_moves.last[:move]

      raise "Tried to move to taken square" unless grid.apply move, @symbol

      # puts "#{@symbol.to_s} moves to #{move.inspect}" unless @recursive
      move
    end
  private

    def rank_move move, grid
      rank = 0
      forecast = grid.clone
      forecast.apply move, @symbol

      # if the move will let us win, it is very important!
      rank += 9_000 if forecast.won?

      # corners are worth 20, edges 10
      rank += ((move[0] - 1).abs + (move[1] - 1).abs) * 10
      # center is worth 30
      rank += 30 if move[0] == 1 && move[1] == 1

      # Moves that allow the player to win next round loose lots o' points.
      # Hopefully this will allow the blocking move to "float" to the top.
      simulated_other_player = SmartPlayer.new(([:x, :o] - [@symbol]).first) # AIception!
      simulated_other_player.recursive = true
      simulated_other_player.move!(forecast) unless @recursive || forecast.stalemate? # this is crap code. fix API
      if forecast.won? 
        rank -= 8_000 # Less than the win points. An immediate win is better than a failure to block.
        # puts "#{move} would have allowed opponent to win next turn" unless @recursive
      else
        # puts "#{move} is okay in regards to short term impacts" unless @recursive
      end

      rank
    end
  end
end