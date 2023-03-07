# Virtual Computer project from CodeAcademy
# https://www.codecademy.com/courses/learn-ruby/lessons/object-oriented-programming-i/exercises/up-up-and-away
# Object-Oriented Programming I

class Computer
    @@users = {}
    def initialize(username, password)
      @username = username
      @password = password
      @files = {}
      @@users[username] = password
    end
  
    def create(filename)
      @time = Time.now
      @files[filename] = @time
      puts "A new file (#{filename}) was created!"
      p "List of files: #{@files}"
    end
  
    def Computer.get_users
      return @@users
    end
  end
  
  my_computer = Computer.new("josh.cook", "password")
  my_computer.create("new_file_1")