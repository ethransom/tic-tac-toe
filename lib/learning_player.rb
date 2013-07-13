module TicTacToe
  # `LearningPlayer` will learn from its mistakes.
  # TODO: Load training data from file.
  class LearningPlayer < Player
    def initialize symbol
      @game_data = []
      @training_data = []
      super
    end

    def start_game
      @game_data = []
    end

    def end_game won
      return unless won

      @training_data.concat @game_data
      puts "Added #{@game_data.length} data-points. Now at #{@training_data.length}"
    end

    def move grid
      moves = grid.moves.shuffle!

      ranked_moves = moves.collect do |move|
        rank = 0
        forecast = grid.clone
        forecast.apply move, @symbol

        # if the move will let us win, it is very important!
        rank += 9_000 if forecast.won?

        {move: move, rank: rank}
      end

      ranked_moves.sort_by! { |combo| combo[:rank] }

      # puts ranked_moves.inspect
      move = ranked_moves.last[:move]

      # puts "#{@symbol.to_s} moves to #{move.inspect}"
      @game_data << {situation: grid, move: move}
      move
    end
  end
private
  class Dataset
  end
end