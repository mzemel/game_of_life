class Presenter
    attr_accessor :grid

    def initialize(grid)
        @grid = grid
    end

    def print
        STDOUT.print "\n"
        grid.height.times do |y|
            grid.width.times do |x|
                print_cell(grid.cells[y][x])
            end
            STDOUT.print "\n"
        end
    end

    private

    def print_cell(cell)
        val = cell.state == 'alive' ? '• ' : '  '
        STDOUT.print val
    end
end