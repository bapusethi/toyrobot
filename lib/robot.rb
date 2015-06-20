$LOAD_PATH << File.join(File.dirname(__FILE__))
require "optparse"
require "logger" 
require "robot/version"
require 'robot/command_parser'
require 'robot/table'
require 'robot/position'
require 'robot/toy_robot'
require "robot/direction"
require "robot/simulator"
require "robot/app"
require "robot/cli"

$logger = Logger.new('log/toy_robot.log')
