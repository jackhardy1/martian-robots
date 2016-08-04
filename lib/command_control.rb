require_relative 'martian_robot'

class CommandControl

  COORDINATE_LIMIT = 50

  def initialize(robot = MartianRobot.new)
    @robot = robot
    @x_limit = 0
    @y_limit = 0
    @x_position = 0
    @y_position = 0
  end

  def enter_grid_size x,y
    raise "Coordinates must be no bigger than 50" if x > COORDINATE_LIMIT || y > COORDINATE_LIMIT
    @x_limit = x
    @y_limit = y
  end

  def enter_starting_coordinates x,y
    raise "Must be within range" if out_of_range? x,y
    @x_position = x
    @y_position = y
  end

  def enter_starting_direction direction
    @robot.set_direction direction
  end

  def turn_robot_left
    @robot.turn_left
  end

  def turn_robot_right
    @robot.turn_right
  end

  def current_position
    if @lost
      "#{@x_position} #{@y_position} #{@directions[0]} LOST"
    else
    "#{@x_position} #{@y_position} #{current_direction}"
    end
  end

  def current_direction
    "#{@robot.current_direction}"
  end

  def show_grid_boundary
    "#{@x_limit} #{@y_limit}"
  end

  def out_of_range? x,y
    x > @x_limit || y > @y_limit
  end
end
