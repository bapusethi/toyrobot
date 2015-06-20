# Toy Robot Description
Toy robot simulator which supports commands like place,left,right,move and report.
The input to command 'PLACE' are X,Y and Direction of face which are separated by ' '. 
Commands 'LEFT','RIFHT','MOVE' and 'REPORT' do not take any arguments and all arguments will be ignored.

## Installation
Install gem dependencies with Bundle:

    $ bundle install

## Testing

Code quality is attempted by using 

[RSpec](http://rspec.info/) for testing
[SimpleCov](https://github.com/colszowka/simplecov) for code test coverage

Run tests:

    $ rspec spec/

Check test coverage (after running rspec):

    $ open coverage/index.html


## Usage

Run command to see the help 
    $ toyrobot -h

Input commands manually on command line:

    $ toyrobot

Run commands from a file:

    $ toyrobot -f [filename]

