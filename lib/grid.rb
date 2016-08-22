class Grid
  DEFAULT_WIDTH = 50
  DEFAULT_HEIGHT = 50

  attr_accessor :presenter
  attr_accessor :width
  attr_accessor :height
  attr_accessor :cells

  def initialize(width = DEFAULT_WIDTH, height = DEFAULT_HEIGHT, cells = nil)
    @width = width
    @height = height
    @presenter = Presenter.new(self)
    @cells = cells || randomize_cells
  end

  def print
    presenter.print
  end

  def next_grid
    Grid.new(width, height, next_cells)
  end

  private

  def next_cells
    _next_cells = {}
    cells.each do |y, rows|
      new_row = {}
      rows.each do |x, cell|
        new_row[x] = next_cell_for(cell, x, y)
      end
      _next_cells[y] = new_row
    end
    _next_cells
  end

  def next_cell_for(cell, x, y)
    survives?(cell, x, y) ? Cell.alive : Cell.dead
  end

  def survives?(cell, x, y)
    _alive_neighbors = alive_neighbors(y,x).count
    # Any live cell with more than three live neighbours dies, as if by over-population.
    return false if _alive_neighbors > 3

    # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
    return false if _alive_neighbors < 2

    # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    # Any live cell with  [...]  three live neighbours lives on to the next generation.
    return true  if _alive_neighbors == 3

    # Any live cell with two [...] live neighbours lives on to the next generation.
    cell.alive?
  end

  def alive_neighbors(x, y)
    neighbors = []

    neighbors << cells[x-1][y]   rescue nil
    neighbors << cells[x+1][y]   rescue nil
    neighbors << cells[x-1][y-1] rescue nil
    neighbors << cells[x+1][y-1] rescue nil
    neighbors << cells[x-1][y+1] rescue nil
    neighbors << cells[x+1][y+1] rescue nil
    neighbors << cells[x][y-1]   rescue nil
    neighbors << cells[x][y+1]   rescue nil

    neighbors.compact.select(&:alive?)
  end

  def randomize_cells
    cells = {}
    height.times do |y|
      row = {}
      width.times do |x|
        row[x] = Cell.new
      end
      cells[y] = row
    end
    self.cells = cells
  end
end
