module TicTacToe
  # TODO: Refactor. Subclass array somehow?
  class Grid
    def initialize
      @table = []

      3.times do |i|
        @table[i] = Array.new 3, :blank
      end
    end

    # http://lukaszwrobel.pl/blog/copy-object-in-ruby
    def clone
      grid = Grid.new

      grid.each! do |val, i, j|
        self.[](i,j)
      end
    end

    def []=(r, c, val)
      @table[r][c] = val
    end

    def [](r, c)
      @table[r][c]
    end

    def at coord
      @table[coord[0]][coord[1]]
    end

    def ==(other)
      other.each do |val, i, j|
        return false unless val == @table[i][j]
      end

      true
    end

    # Iterates over each cell in the grid, providing a block with it's contents and coordinates.
    def each
      3.times do |i|
        3.times do |j|
          yield(@table[i][j], i, j)
        end
      end

      self # Chainability! Yay!
    end

    # Same as `each`, but sets the cell to the return value of the block.
    def each!
      each do |item, i, j|
        @table[i][j] = yield(@table[i][j], i, j) || @table[i][j]
      end

      self # Chainability! Yay!
    end

    def won
    end

    def won?
      [:x, :o].each do |player|
        possible_wins.each do |combination|
          # puts "Checking combination #{combination}..."

          combination_valid = combination.each do |coordinate|
            cell = @table[coordinate[0]][coordinate[1]]
            # puts "\t Checking coordinate #{coordinate} ... #{cell} == #{player}"
            break false if cell != player
          end

          # puts "#{combination_valid}\n"

          return true if combination_valid # TODO: Return symbol of winning player?
        end
      end

      false
    end

    def stalemate?
      !collect.include? :blank
    end

    # TODO: Tests!!!
    # TODO: Make ! method
    # Makes the moves for players. Will only overwrite `:blank` spaces.
    def apply move, symbol=:x
      @table[move[0]][move[1]] = symbol if @table[move[0]][move[1]] == :blank
    end

    def pretty_print
      3.times do |i|
        print "|"
        3.times do |j|
          print (
            case @table[i][j]
            when :blank
              " "
            when :x
              "X"
            when :o
              "O"
            else
              "?"
            end
          )
        end
        print "|\n"
      end
    end

    # Returns an array of possible moves, stored as 2 item arrays.
    def moves
      answers = []

      3.times do |i|
        3.times do |j|
          answers.push [i,j] if @table[i][j] == :blank
        end
      end

      answers
    end

    def inspect
      @table.inspect
    end

  # private
    # Private for now. Probably will expose later.
    def collect
      array = []
      @table.each do |subarray|
        array.concat subarray
      end
      array
    end

    def possible_wins
      # diagonals first
      array = [
        [[0,0],[1,1],[2,2]],
        [[2,0],[1,1],[0,2]],
      ]

      # horizontals
      array.concat([0,1,2].collect do |i|
        [[i,0],[i,1],[i,2]]
      end)

      # verticals
      array.concat([0,1,2].collect do |i|
        [[0,i],[1,i],[2,i]]
      end)
    end
  end
end
