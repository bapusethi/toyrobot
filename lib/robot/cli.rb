module Robot
  class CLI
    
    def initialize
      options = {:file => nil , :x => 5 , :y => 5}
      parser = OptionParser.new do|opts|
        opts.banner = "Usage: toyrobot [options]"
        
        opts.on('-f', '--file filepath', 'Filepath for input commands') do |filename|
          options[:file] = filename
        end
        
        opts.on('-x', '--xcoordinate X', 'Max X co-ordinate(Number)') do |max_x|
          begin
            options[:x] =  Integer(max_x)
          rescue
            puts "Invalid x argument"
            puts opts
            exit
          end  
        end
        
        opts.on('-y', '--ycoordinate Y', 'Max Y co-ordinate(Number)') do |max_y|
          begin
           options[:y] =  Integer(max_y)
          rescue
            puts "Invalid y argument"
            puts opts
            exit
          end 
        end
        
        opts.on('-h', '--help', 'Displays Help') do
          puts opts
          exit
        end
     end   
     parser.parse!
      @application = Robot::App.new(options)
    end
    
    def start
      @application.start
    end
    
  end
end