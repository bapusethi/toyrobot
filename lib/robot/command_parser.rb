module Robot
  class CommandParser
    
    @@number_reg = /^\d+$/
    
    # allowed_commnads is a hash 
    # with value as :method => [[arg types],[regex_range_for_strings_only]]
    def initialize(allowed_commands)
      @allowed_commands = allowed_commands
      $logger.info("Allowed commands are #{@allowed_commands.keys}")
    end
    
    def parse command
        $logger.debug("Parsing command #{command}")       
        args = command.split " "
        method = args.delete_at(0)
        
        if valid?(method, args)   
          update_args! method , args
          yield method , args
          return true
        else
          $logger.warn("Parsing failed. Invalid #{command}")
          return false
        end
    end
    
    
   private
    
     def update_args! method , args     
       @allowed_commands[method][0].each_with_index do |arg_type,i|
         case arg_type
           when :number
             args[i] = args[i].to_i 
           when :string
         end
       end
     end
      
    
     def valid? (method , args) 
       return false unless @allowed_commands.has_key? method
       
       unless  @allowed_commands[method].nil?
         return false unless @allowed_commands[method][0].size == args.size
         @allowed_commands[method][0].each_with_index do |arg_type,i|
           case arg_type
             when :number
               return false unless args[i] =~ @@number_reg
             when :string
               allowed_reg = @allowed_commands[method][1][i]
               unless allowed_reg.nil?
                 return false unless args[i] =~ /#{allowed_reg}/
               end
            end    
          end
        end
        return true
      end
          
  end
end