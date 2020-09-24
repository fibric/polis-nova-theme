# The Greeter class
class Greeter
    attr_reader :name

    def initialize(name)
        @name = name.capitalize
    end

    def salute
        puts "Hello #{@name}!"
    end
end

g = Greeter.new("world")
g.salute

module State
    STOPPED = 1
    STARTED = 2
    PAUSED = 4
end

flags = State::PAUSED | State::STARTED
