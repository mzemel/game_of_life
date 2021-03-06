class Presenter
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def print_grid
    print grid.cells.map { |row| row_string(row) }.join("\n")
  end

  private

  def row_string(row)
    row.map { |cell| sprite(cell) }.join(" ")
  end

  def sprite(cell)
    cell.alive? ? '🐰' : ' '
  end

end
