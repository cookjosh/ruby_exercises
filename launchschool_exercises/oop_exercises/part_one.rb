# Exercise from LaunchSchool Classes and Objects Part I
# https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1

class MyCar
    attr_accessor :color
    attr_reader :year

    def initialize(year, color, model)
        @year = year
        @color = color
        @model = model
        @speed = 0
    end

    def speed_up(increase)
        @speed += increase
    end

    def slow_down(decrease)
        @speed -= decrease
    end

    def shut_off()
        @speed = 0
    end

    def spray_paint(new_color)
        self.color = new_color
    end
end