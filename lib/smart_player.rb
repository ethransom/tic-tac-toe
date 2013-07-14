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
      rank += perimeter_rank move
      # center is worth 30
      rank += 30 if center? move

      # Moves that allow the player to win next round loose lots o' points.
      # Hopefully this will allow the blocking move to "float" to the top.
      if loose_next_round(forecast)
        rank -= 8_000 # Less than the win points. An immediate win is better than a failure to block.
        # puts "#{move} would have allowed opponent to win next turn" unless @recursive
      else
        # puts "#{move} is okay in regards to short term impacts" unless @recursive
      end

      rank
    end

    def loose_next_round forecast
      other_player = SmartPlayer.new(([:x, :o] - [@symbol]).first) # AIception!
      other_player.recursive = true
      other_player.move!(forecast) unless @recursive || forecast.stalemate?
      forecast.won?
    end

    def center? move
      move[0] == 1 && move[1] == 1
    end

    def perimeter_rank move
      ((move[0] - 1).abs + (move[1] - 1).abs) * 10
    end
  end
end