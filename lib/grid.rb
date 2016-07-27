class Grid
	DEFAULT_WIDTH = 30
	DEFAULT_HEIGHT = 30

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

	def next_grid
		Grid.new(width, height, next_cells)
	end

	def next_cell_for(cell, x, y)
		survives?(cell, x, y) ? Cell.new('alive') : Cell.new('dead')
	end

	def survives?(cell, x, y)
		_alive_neighbors = alive_neighbors(y,x).count
		if cell.alive? && _alive_neighbors >=2 && _alive_neighbors <= 3
			true
		elsif cell.dead? && _alive_neighbors == 3
			true
		else
			false
		end
	end

	def alive_neighbors(x, y)
		neighbors = []

		neighbors << cells[x-1][y]   rescue neighbors << nil
		neighbors << cells[x+1][y]   rescue neighbors << nil
		neighbors << cells[x-1][y-1] rescue neighbors << nil
		neighbors << cells[x+1][y-1] rescue neighbors << nil
		neighbors << cells[x-1][y+1] rescue neighbors << nil
		neighbors << cells[x+1][y+1] rescue neighbors << nil
		neighbors << cells[x][y-1]   rescue neighbors << nil
		neighbors << cells[x][y+1]   rescue neighbors << nil

		neighbors.select {|n| !n.nil? && n.state == 'alive'}
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