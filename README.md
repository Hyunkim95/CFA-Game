# The Maze Game

The Maze Game is a 2D based puzzle game which involves the use of the keyboard. The controls are in the classic WASD format whereby:

w - moves up
a - moves left
s - moves down
d - moves right

The aim of the game is to navigate your character to the finish spot, indicated a white '9'.


## Installation Instructions

The game requires the following gems:
* Paint Gem 
* Terminal-Table Gem

```
require 'terminal-table'
require 'paint'
```

## Usage Instruction

Change directory to where the files exist, as this game requires a csv file, enter terminal and input the following:

```
$ vi Maze.csv
Name,Score
~                                                                       
~
:wq
$
```
and type $ruby start.rb in terminal

## Design Journery/Process

Flowchart --> Write code to work --> Refactor --> Add graphics --> Refactor

## Documentation of how our team designed the app

Flow Chart

                            Load Map
                            
                        Find Start and End
                    
                    Place Character at Start
                
        Loop until character is placed at the finish coordinate
        
                    Print out highscore
                    

<img src="http://i.imgur.com/Kdyg93a.png" >




