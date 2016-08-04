# martian-robots


#### Instructions for use

To clone this repository into your desired folder, run:

```
git clone git@github.com:jackhardy1/martian-robots-test.git
```

Then run 'bundle install' to install RSpec

To run the tests, run 'rspec' in the command line

I have explained one of the failing tests below in this readme. This is to do with an error with the given sample data. Please see further down at: "Notes on the sample input and output given in the original document".


#### What would I improve on if I had more time?

This did take me more than 3 hours as I really wanted to get the logic to work well. As a consequence, I didn't have time to work on the user interface, which I would have wanted to implement. But it works and was a lot of fun doing it!

If I had more time, I would have liked to have also done:

Another class for commands, so that I can extend this with more commands at a later date.

Another class for a grid / planet, with set boundaries.

A proper command line interface to be able to interact with user inputs (gets.chomp) from the terminal

Included tests for edge cases

More refactoring with my tests to include doubles to mock the behaviour of the robot.

More refactoring with my other code.

A front-end interactive display viewable on a phone / website.



#### How to play the game from IRB / PRY:

#### Methods for use:

enter_grid_size(x,y)

enter_starting_coordinates(x,y)

enter_starting_direction('n'/'e'/'s'/'w')

enter_commands('L'/'R'/F)

go

current_position

#### Step 1)

Create a new game.

```
require './lib/command_control.rb'
robot = MartianRobot.new
new_game = CommandControl.new(robot)
```

#### Step 2)

Declare the grid size

```
new_game.enter_grid_size 5,3
```

#### Step 3)

Enter starting coordinates

```
new_game.enter_starting_coordinates 1,1
```

#### Step 4)

Enter starting direction

```
new_game.enter_starting_direction 'e'
```

#### Step 5)

Enter movements / commands (left, right and forward as L,R,F)

```
new_game.enter_commands "RFRFRFRF"
```

#### Step 6)

carry out the commands with 'go'

```
new_game.go
```

#### Step 7)

find the result

```
new_game.current_position
```
=> "1 1 E"



#### Notes on the sample input and output given in the original document:

From the original text provided, I have noticed an error with the third sample input / output. This is where the input is (0 3 W LLFFFLFLFL), and the output is (2 3 S).

The output should be the same as the second sample input / output (3 3 N LOST). I will show this below:

The grid dimensions are set at 5,3 (5 long(x) and 3 high(y)), and movements are as follows:

Original location = 0 3 W

L = 0 3 S

L = 0 3 E

F = 1 3 E

F = 2 3 E

F = 3 3 E

L = 3 3 N

F = 3 3 N LOST

I have left the failing RSpec test (input/output 3) to show this.

In order to achieve the final result of 2 3 S, you would need to set the starting coordinates to 0 2 W instead.






#### Original copy

Problem: Martian Robots

The surface of Mars can be modelled by a rectangular grid around which robots are able to move according to instructions provided from Earth. You are to write a program that determines each sequence of robot positions and reports the final position of the robot.

A robot position consists of a grid coordinate (a pair of integers: x-coordinate followed by y-coordinate) and an orientation (N, S, E, W for north, south, east, and west).
A robot instruction is a string of the letters “L”, “R”, and “F” which represent, respectively, the instructions:

● Left : the robot turns left 90 degrees and remains on the current grid point.
● Right : the robot turns right 90 degrees and remains on the current grid point.
● Forward : the robot moves forward one grid point in the direction of the current
orientation and maintains the same orientation.

The direction North corresponds to the direction from grid point (x, y) to grid point (x, y+1). There is also a possibility that additional command types may be required in the future and provision should be made for this.

Since the grid is rectangular and bounded (...yes Mars is a strange planet), a robot that moves “off” an edge of the grid is lost forever. However, lost robots leave a robot “scent” that prohibits future robots from dropping off the world at the same grid point. The scent is left at the last grid position the robot occupied before disappearing over the edge. An instruction to move “off” the world from a grid point from which a robot has been previously lost is simply ignored by the current robot.

The Input

The first line of input is the upper-right coordinates of the rectangular world, the lower-left coordinates are assumed to be 0, 0.

The remaining input consists of a sequence of robot positions and instructions (two lines per robot). A position consists of two integers specifying the initial coordinates of the robot and an orientation (N, S, E, W), all separated by whitespace on one line. A robot instruction is a string of the letters “L”, “R”, and “F” on one line.
Each robot is processed sequentially, i.e., finishes executing the robot instructions before the next robot begins execution.

The maximum value for any coordinate is 50.
All instruction strings will be less than 100 characters in length.

The Output

For each robot position/instruction in the input, the output should indicate the final grid position and orientation of the robot. If a robot falls off the edge of the grid the word “LOST” should be printed after the position and orientation.

Sample Input

53
11 E RFRFRFRF
32 N FRRFLLFFRRFLL
03 W LLFFFLFLFL

Sample Output

11 E
33 N LOST
23 S
