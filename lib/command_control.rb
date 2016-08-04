require_relative 'martian_robot'

class CommandControl

  COORDINATE_LIMIT = 50

  def initialize(robot = MartianRobot.new)
    @robot = robot
    @x_limit = 0
    @y_limit = 0
    @x_position = 0
    @y_position = 0
    @commands = []
  end

  def enter_grid_size x,y
    raise "Coordinates must be no bigger than 50" if over_coordinate_limit? x,y
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

  def enter_commands commands
    @commands = commands.chars.map(&:upcase)
  end

  def go
    unless robot_lost? || @commands.empty?
      selected_command = @commands.slice!(0)
        case selected_command
        when "L" then turn_robot_left
        when "R" then turn_robot_right
        when "F" then move_robot_forward
      end
      go
    end
  end

  def move_robot_forward
    case robot_direction
    when 'N' then move_robot_north
    when 'E' then move_robot_east
    when 'S' then move_robot_south
    when 'W' then move_robot_west
    end
  end

  def turn_robot_left
    @robot.turn_left
  end

  def turn_robot_right
    @robot.turn_right
  end

  def move_robot_north
    (@y_position + 1) > @y_limit ? @robot.lost = true : @y_position += 1
  end

  def move_robot_east
    (@x_position + 1) > @x_limit ? @robot.lost = true : @x_position += 1
  end

  def move_robot_south
    (@y_position - 1) < 0 ? @robot.lost = true : @y_position -= 1
  end

  def move_robot_west
    (@x_position - 1) < 0 ? @robot.lost = true : @x_position -= 1
  end

  def show_grid_boundary
    "#{@x_limit} #{@y_limit}"
  end

  def current_position
    if robot_lost?
      "#{@x_position} #{@y_position} #{robot_direction} LOST"
    else
      "#{@x_position} #{@y_position} #{robot_direction}"
    end
  end

  def robot_direction
    @robot.current_direction
  end

  private

  def robot_lost?
    @robot.lost?
  end

  def out_of_range? x,y
    x > @x_limit || y > @y_limit
  end

  def over_coordinate_limit? x,y
    x > COORDINATE_LIMIT || y > COORDINATE_LIMIT
  end
end
