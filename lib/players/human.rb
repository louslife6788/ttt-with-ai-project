

module Players

    class Human < Player

        def move(board)
            puts"Pick a move from 1 - 9  "
            input = gets.chomp
        end

    end

end

            