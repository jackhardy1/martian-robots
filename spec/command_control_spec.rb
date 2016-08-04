require './lib/command_control'
require './lib/martian_robot'

describe CommandControl do

  let (:robot) {MartianRobot.new}
  let (:control) {CommandControl.new(robot)}

  context 'errors' do
    it 'x should be no more than 50' do
      expect{control.enter_grid_size 51,49}.to raise_error "Coordinates must be no bigger than 50"
    end

    it 'y should be no more than 50' do
      expect{control.enter_grid_size 49,51}.to raise_error "Coordinates must be no bigger than 50"
    end

    it 'starting coordinates must be within range' do
      control.enter_grid_size 6,6
      expect{control.enter_starting_coordinates 7,7}.to raise_error "Must be within range"
    end
  end

  describe '#enter_grid_size' do
    it 'sets boundaries of the grid' do
      control.enter_grid_size 10,10
      expect(control.show_grid_boundary).to eq "10 10"
    end
  end

  context '#enter_starting_coordinates' do
    it 'sets orientation of robot' do
      allow(robot).to receive(:current_direction).and_return("E")
      control.enter_grid_size 10,10
      control.enter_starting_coordinates 4,4
      control.enter_starting_direction "e"
      expect(control.current_position).to eq "4 4 E"
    end
  end

  context 'moving the robot' do
    before(:each) do
      control.enter_grid_size 10,10
      control.enter_starting_coordinates 4,4
      control.enter_starting_direction "e"
    end

    it 'turning left' do
      control.turn_robot_left
      expect(control.robot_direction).to eq 'N'
    end

    it 'turning right' do
      control.turn_robot_right
      expect(control.robot_direction).to eq 'S'
    end

    it 'moves forward in set direction' do
      control.move_robot_forward
      expect(control.current_position).to eq "5 4 E"
    end
  end

  context 'commands: ' do
    before(:each) do
      control.enter_grid_size 10,10
      control.enter_starting_coordinates 4,4
      control.enter_starting_direction "e"
    end

    it 'L will move the robot left' do
      control.enter_commands('L')
      control.go
      expect(control.current_position).to eq "4 4 N"
    end

    it 'R will move the robot right' do
      control.enter_commands('R')
      control.go
      expect(control.current_position).to eq "4 4 S"
    end

    it 'F will move the robot forward' do
      control.enter_commands('F')
      control.go
      expect(control.current_position).to eq "5 4 E"
    end

    it 'can accept more than one command' do
      control.enter_commands('FFRR')
      control.go
      expect(control.current_position).to eq "6 4 W"
    end
  end
end
