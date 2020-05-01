class Board
    attr_reader :size
    def initialize(n)
        @grid=Array.new(n){Array.new(n,:N)}
        @size=n*n
    end

    def [](arr)
        row=arr.first
        col=arr.last
        @grid[row][col]
    end

    def []=(position,val)
        row,col=position
        @grid[row][col]=val
    end

    def num_ships
        @grid.flatten.count{|ele| ele==:S}
    end

    def attack(position)
        if self[position]==:S
            self[position]=:H
            puts "you sunk my battleship!"
            return true
        else
            self[position]=:X
            return false
        end
    end

    def place_random_ships
        n=@grid.length
        while self.num_ships<@size/4
            row=rand(0...n)
            col=rand(0...n)
            @grid[row][col]=:S
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |ele|
                if ele==:S
                    :N
                else
                    ele
                end
            end
        end
    end

    # heed how we make this hidden grid.

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end

