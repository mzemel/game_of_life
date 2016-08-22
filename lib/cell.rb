class Cell
  attr_accessor :state

  def initialize(state = nil)
    @state = state || set_random_state
  end

  def self.alive
    Cell.new(:alive)
  end

  def self.dead
    Cell.new(:dead)
  end

  def ==(other)
    state == other.state
  end

  def alive?
    self == Cell.alive
  end

  def dead?
    self == Cell.dead
  end

  private

  def set_random_state
    [0,1].sample.zero? ? Cell.alive.state : Cell.dead.state
  end
end
