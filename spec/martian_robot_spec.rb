require './lib/command_control'
require './lib/martian_robot'

describe MartianRobot do

  context 'default settings' do
    it 'robot is not lost' do
      expect(subject.lost?).to eq false
    end
  end

  context 'movements' do
    it 'turns left' do
      subject.set_direction "N"
      subject.turn_left
      expect(subject.current_direction).to eq 'W'
    end
    
    it 'turns right' do
      subject.set_direction "N"
      subject.turn_right
      expect(subject.current_direction).to eq "E"
    end
  end

end
