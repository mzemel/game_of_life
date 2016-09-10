class Cell
  attr_accessor :state


  DEAD_CELL = Cell.new
  ALIVE_CELL = Cell.new

  def self.random
    [DEAD_CELL, ALIVE_CELL].sample
  end

  def self.alive
    ALIVE_CELL
  end

  def self.dead
    DEAD_CELL
  end

  def alive?
    self == ALIVE_CELL
  end

  def dead?
    self == DEAD_CELL
  end

  def to_s
    alive? ? '🐰' : ' '
  end

end
