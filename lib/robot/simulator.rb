module Robot
  
  class Simulator
      
     attr_accessor :toy_robot
      
     def initialize max_x, max_y
       commands = {
                   "PLACE"  => [
                                 [:number , :number , :string],
                                 [nil,nil,"^NORTH$|^SOUTH$|^EAST$|^WEST$"]
                               ], 
                   "MOVE"   => [[],[]], 
                   "LEFT"   => [[],[]],
                   "RIGHT"  => [[],[]], 
                   "REPORT" => [[],[]] 
                  }
       @command_parser = CommandParser.new(commands)
       @table          = Table.new max_x , max_y
       @toy_robot      = ToyRobot.new
       $logger.info "Simulator created successfully."
     end
     
     def execute(command)
        r = @command_parser.parse(command) do |method,args|
          $logger.debug("#{method.downcase} - args #{args}")
          self.send( method.downcase , * args)
        end
        $logger.debug(@toy_robot.to_s)
     end
     
     def place x , y , face
       if @table.inside?(x, y)
         @toy_robot.position = Position.new(x, y, Direction.find(face))
         @toy_robot.placed   = true
       end
     end
    
     def move
       return unless @toy_robot.placed     
       next_position =  @toy_robot.position.move
       if @table.inside? next_position.x , next_position.y
         @toy_robot.position = next_position
       else
         ignore
       end
     end
  
     def left
       return unless @toy_robot.placed  
       @toy_robot.position = @toy_robot.position.left  
     end
     
     def right
       return unless @toy_robot.placed
       @toy_robot.position = @toy_robot.position.right
     end
     
     def report
       if @toy_robot.placed
         puts "#{@toy_robot.position.x} #{@toy_robot.position.y} #{@toy_robot.position.direction}"
       else
         puts "Robot is not placed yet. Please use PLACE command to place the robot."
       end
     end
     
     def ignore
       $logger.debug "Ignored step towards #{toy_robot.position.direction}"
     end
     
  end
  
  
end
