
require "pry"

class Game

    WIN_COMBINATIONS =  [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [6,4,2]
      ]

      attr_accessor :player_1, :player_2, :board

    def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board

    end




    def board
       @board
    end


    def current_player
        @board.turn_count % 2 == 0 ? @player_1 : @player_2
    end

    def turn
        player = current_player
        current_move = player.move(@board)
        if !@board.valid_move?(current_move)
          turn
        else
          puts "Turn: #{@board.turn_count+1}\n"
          @board.display
          @board.update(current_move, player)
          puts "#{player.token} moved #{current_move}"
          @board.display
          puts "\n\n"
        end
      end
    
      def play
        while !over?
          turn
        end
        if won?
          puts "Congratulations #{winner}!"
        elsif draw?
          puts "Cat's Game!"
        end
      end

    def won?
        WIN_COMBINATIONS.detect do |combo|
            @board.cells[combo[0]] == @board.cells[combo[1]] &&
            @board.cells[combo[1]] == @board.cells[combo[2]] && 
            @board.cells[combo[0]] != " "
        end
    
    end

    def draw?
         !self.won? && @board.full?
    end

    def over?
        self.draw? || self.won?
    end
    
    def winner
        if self.won?
            @board.cells[won?[1]]
      
        end
       
    end

end





