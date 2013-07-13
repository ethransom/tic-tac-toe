require_relative 'grid.rb'
require_relative 'player.rb'
require_relative 'random_player.rb'

module TicTacToe
  class Game
    attr_reader :winner

    def initialize player1 = nil, player2 = nil
      @grid = Grid.new
      @players = []
      @players.push player1 || RandomPlayer.new(:x)
      @players.push player2 || RandomPlayer.new(:o)
      @winner = nil
    end

    def play!
      # puts "Playing..."
      until over?
        @players.each do |player|
          move = player.move!(@grid)
          
          # puts move

          # @grid.pretty_print

          if over?
            if @grid.stalemate?
              # puts "Game ends in a draw..."
            elsif @grid.won?
              # puts "#{player.class} has won the game!"
              @winner = player
            end

            break
          end
        end
      end
    end

  private
    def over?
      @grid.stalemate? || @grid.won?
    end
  end
end
