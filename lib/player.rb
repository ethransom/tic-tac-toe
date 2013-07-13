module TicTacToe
  class Player
    attr_reader :symbol

    def initialize symbol
      @symbol = symbol
    end

    def puts msg
      Kernel::puts "#{@symbol.to_s}: #{msg}"
    end
  end
end
