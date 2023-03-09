# Exercise from LaunchSchool Classes and Objects Part I & II
# https://launchschool.com/books/oo_ruby/read/classes_and_objects_part1

class MyCar
    # Part I
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

    # Part II
    def self.gas_mileage(gallons, total_miles)
        puts "#{total_miles/gallons}mpg for this vehicle."
    end

    def to_s
        "Overridden to_s method :)!"
    end

end

MyCar.gas_mileage(15, 400)
new_car = MyCar.new(2002, "blue", "mustang")
puts new_car