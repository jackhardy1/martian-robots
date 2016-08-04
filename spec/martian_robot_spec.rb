require './lib/command_control'
require './lib/martian_robot'

describe MartianRobot do

  context 'default settings' do
    it 'robot is not lost' do
      expect(subject.lost?).to eq false
    end
  end

  context 'movements' do
    it 'changes direction' do
      # subject.
    end
  end

end
