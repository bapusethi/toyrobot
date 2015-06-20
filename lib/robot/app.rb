module Robot
 class App
   def initialize(opts)
     @input_file = opts[:file].nil? ?  STDIN : File.open(opts[:file]) 
     @simulator  = Robot::Simulator.new opts[:x], opts[:y]
   end
 
   def start     
     command = read_command
     while (command) do  
       $logger.debug("Received command #{command}")
       begin
        @simulator.execute command
       rescue => e
         $logger.error(e)
       end
       command = read_command
     end
   end
   
   def read_command
     print "# " if @input_file == STDIN
     command = @input_file.gets
     exit if command.nil? || (command.chomp.downcase == ".quit")
     command  
   end
   
 end
end