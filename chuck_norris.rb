class ChuckNorris
  def initialize
    file, line, method = caller[0].split ":" 
    method = method.match(/`(.*)'/)[1]
    source = File.readlines(file)
    pointer = line.to_i - 1
    (line.to_i - 1).downto(0) do |i|
      break if source[i].match(/class (.*)\s/)
    end
    return "Ah, nice try." if $1 == "ChuckNorris" 
    puts "No one initializes Chuck Norris, do you understand #{$1}? No one." 
    puts "Chuck Norris roundhouse kicks #{$1} so strong that it kills all his siblings too." 
    ObjectSpace.each_object(ObjectSpace.const_get($1)) {|o| o = nil}
  end

  def self.inherited(subclass)
    puts "Understand me, #{subclass}, no one inherits from Chuck Norris, no one." 
    raise "CannotSubClassTheChuckNorris" 
  end
end
