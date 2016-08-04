require_relative 'command_control'

class MartianRobot
  attr_accessor :lost

  def initialize
    @directions = ['N','E','S','W']
    @lost = false
  end

  def set_direction direction
    @directions.rotate!(@directions.index(direction.upcase))
  end

  def current_direction
    @directions[0]
  end

  def turn_left
    @directions.rotate!(-1)
  end

  def turn_right
    @directions.rotate!(1)
  end

  def lost?
    @lost
  end

end
