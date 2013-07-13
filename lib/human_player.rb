module TicTacToe
  # `HumanPlayer` will ask a human through the console for its move.
  class HumanPlayer < Player
    def move grid
      move = grid.moves.sample

      puts "What is #{@symbol.to_s}'s move? Example: '1,2'"
      move = nil
      while true
      	input = gets.chomp.split ','
      	puts "=> #{input.inspect}"
      	next if input.length != 2

      	move = input.collect {|s| s.to_i }
      	break
      end

      puts "#{@symbol.to_s} moves to #{move.inspect}"
      move
    end
  end
end