require 'command_control'

describe CommandControl do

  context 'Red Badger examples:' do
    before(:each) do
      subject.enter_grid_size 5,3
    end

    it 'example 1' do
      subject.enter_starting_coordinates 1,1
      subject.enter_starting_direction "e"
      subject.enter_commands 'RFRFRFRF'
      subject.go
      expect(subject.current_position).to eq '1 1 E'
    end

    it 'example 2' do
      subject.enter_starting_coordinates 3,2
      subject.enter_starting_direction "n"
      subject.enter_commands 'FRRFLLFFRRFLL'
      subject.go
      expect(subject.current_position).to eq '3 3 N LOST'
    end

    it 'example 3' do
      subject.enter_starting_coordinates 0,3
      subject.enter_starting_direction "W"
      subject.enter_commands 'LLFFFLFLFL'
      subject.go
      expect(subject.current_position).to eq '2 3 S'
    end
  end

  context 'further examples:' do
    it 'example 4' do
      subject.enter_grid_size 24,49
      subject.enter_starting_coordinates 14,44
      subject.enter_starting_direction "W"
      subject.enter_commands 'FFFFLLLLFFFRRRLRLRFF'
      subject.go
      expect(subject.current_position).to eq '7 42 S'
    end

    it 'example 5' do
      subject.enter_grid_size 4,4
      subject.enter_starting_coordinates 0,0
      subject.enter_starting_direction "n"
      subject.enter_commands "FFFFFF"
      subject.go
      expect(subject.current_position).to eq "0 4 N LOST"
    end

    it 'example 6' do
      subject.enter_grid_size 5,5
      subject.enter_starting_coordinates 0,0
      subject.enter_starting_direction "e"
      subject.enter_commands "FFLFFFFFF"
      subject.go
      expect(subject.current_position).to eq "2 5 N LOST"
    end
  end
end
