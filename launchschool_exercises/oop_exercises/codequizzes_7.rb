# Exercises from CodeQuizzes
# https://www.codequizzes.com/ruby/beginner/modules-classes-inheritance
# OOP practice

# Create a Dog class that is initialized with a name.
# Add a bark() instance method to the Dog class that returns "Ruff ruff".
=begin
class Dog 
    def initialize(name)
        @name = name
    end
    def bark()
        "Ruff ruff"
    end
end

# Create a new instance of the Dog class.
spot = Dog.new("spot")
puts spot.bark

# Add an instance method to the Insect class to calculate the age_in_years.
class Insect
    def initialize(age_in_days)
      @age_in_days = age_in_days
    end
    def age_in_years()
        return (@age_in_days.to_f / 365)
    end
end

# Create a Lamp class with a class method called about_me that returns the String "We brighten up people's lives".
class Lamp
    def self.about_me()
        return "We brighten up people's lives."
    end
end
print Lamp.about_me()

# Add a method to the WaterBottle class that returns the size of the WaterBottle and demonstrate how this method can be used.
class WaterBottle
    def initialize(size)
      @size = size
    end
    def describe_size()
        return "This water bottle's size is #{@size}oz!"
    end
end

hydroflask = WaterBottle.new(24)
puts hydroflask.describe_size()


# Create a Person class that is initialized with an age and create an age=() method that can be used to update the @age instance variable. 
# Also include an age method that returns the value of the @age instance variable. Demonstrate how the methods can be used.
class Person
    attr_accessor :age
    def initialize(age)
        @age = age
    end
    def update_age(new_age)
        self.age = new_age
    end
    def show_age()
        return self.age
    end
end

me = Person.new(35)
me.update_age(36)
puts me.show_age()


# Demonstrate that instances of the Person class and instances of the Alien class can use the say_something() method.
module HappyHappy
    def say_something()
        return("Happy happy, joy joy")
    end
end

class Person
    include HappyHappy
end

class Alien
    include HappyHappy
end

me = Person.new()
martian = Alien.new()
puts me.say_something()
puts martian.say_something()


# Create a module called MathHelper with a method multiply_by_two() that takes a number as an argument and multiplies it by two. 
# Create a class called Homework and demonstrate how multiply_by_two() can be used.
module MathHelper
    def multiply_by_two(num)
        return num * 2
    end
end

class Homework
    include MathHelper
end

math_work = Homework.new()
puts math_work.multiply_by_two(2)

# Demonstrate that instances of the Dog class have access to the heartbeat? method.
class Mammal
    def heartbeat?
      true
    end
end
  
class Dog < Mammal
end

spot = Dog.new()
puts spot.heartbeat?

# Create a BaseballPlayer class that is initialized with hits, walks, and at_bats. 
# Add a batting_average() method that returns hits divided by at_bats as a floating point number. 
# Add an on_base_percentage() method that returns (hits + walks) divided by at_bats as a floating point number. 
# Demonstrate how the batting_average() and on_base_percentage() methods can be used.
class BaseballPlayer
    def initialize(hits, walks, at_bats)
        @hits = hits
        @walks = walks
        @at_bats = at_bats
    end
    def batting_average()
        return (@hits.to_f / @at_bats)
    end
    def on_base_percentage()
        return ((@hits+@walks).to_f/@at_bats)
    end
end

trout = BaseballPlayer.new(20, 10, 60)
puts trout.batting_average()
puts trout.on_base_percentage()


# Create a Person class that is initialized with a first_name and last_name. 
# Create first_name() and last_name() methods that return the values of the corresponding instance variables. 
# Create a full_name() method that concatenates the first_name and last_name in a single string.
class Person
    def initialize(first_name, last_name)
        @first_name = first_name
        @last_name = last_name
    end
    def show_first_name()
        return @first_name
    end
    def show_last_name()
        return @last_name
    end
    def full_name()
        return "Full name: #{@first_name} #{@last_name}"
    end
end

me = Person.new("Josh", "Cook")
puts me.show_first_name()
puts me.show_last_name()
puts me.full_name()
=end


# Create a module called MathHelpers with the exponent() method that takes a two numbers as arguments and raises the first number to the power of the second number. 
# Create a class called Calculator with a method called square_root() that takes the square root of the number (raises it to the power of 0.5). 
# The square_root() method should use the exponent() method.
module MathHelpers
    def exponent(num_one, num_two)
        return num_one ** num_two
    end
end

class Calculator
    include MathHelpers
    def square_root(num_one)
        return exponent(num_one, 0.5)
    end
end

calc = Calculator.new()
puts calc.square_root(100)
