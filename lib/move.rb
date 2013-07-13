module TicTacToe
# private 

  class Move
    attr_reader :coordinate
    def initialize(coordinate)
      @coordinate = coordinate
    end
    
    # Returns coordinates next to self.
    def neighbor_coords
      coordinates = [
        up,
        down,
        right, 
        left,
        # Diagonals
        # Move.new(up).right,
        # Move.new(up).left,
        # Move.new(down).right,
        # Move.new(down).left
        up_right,
        up_left,
        down_right,
        down_left
      ]

      coordinates.compact
    end

    def up
      if row != 0
        [row - 1, column]
      end
    end

    def down
      if row != 2
        [row + 1, column]
      end
    end

    def right
      if column != 2
        [row, column + 1]
      end
    end

    def left
      if column != 0
        [row, column - 1]
      end
    end

    def up_right
      move = Move.new(up) if up
      move.right if move
    end

    def up_left
      move = Move.new(up) if up
      move.left if move
    end

    def down_right
      move = Move.new(down) if down
      move.right if move
    end

    def down_left
      move = Move.new(down) if down
      move.left if move
    end

    def row
      @coordinate[0]
    end

    def column
      @coordinate[1]
    end
  end
end