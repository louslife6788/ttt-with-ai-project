class Board


    attr_accessor :cells

    


    def initialize()
        self.reset!

    end




    def cells
        @cells 
    end

    def reset!
        @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end 


    def display
        puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
        puts "---------------" 
        puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
        puts "---------------" 
        puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
         pos = input.to_i - 1
         self.cells[pos]
    end 

    def full?
        !self.cells.include?(" ")
    end

    def turn_count
        self.cells.count {|cell| cell != " "}
    end

    def taken?(input)
       self.position(input) != " "
    end

    def valid_move?(input)
         input.to_i.between?(1, 9) && !taken?(input)
    end


    def update(input, player)
        @cells[input.to_i - 1] = player.token
       
    end


    # def update(input, player)                      why wont this work ?
    #     self.position(input) = player.token
       
    # end
    
    


end