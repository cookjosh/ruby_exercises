class Knight
  attr_accessor :queue_array, :visited_squares_array

  def initialize
    @queue_array = []
    @visited_squares_array = []
    @final_array = []
  end
  
  def knight_moves(current_point = nil, end_point = nil, board = nil, counter = 0)

    board.each do |elem|
      if elem[0] == current_point
        current_point = elem
      end
    end

    current_point = Square.new(current_point)

    @queue_array << current_point

    reached_end = false

    while reached_end == false
      
      if @visited_squares_array.include? @queue_array[0]
        @queue_array.shift

      elsif @queue_array[0].spot == end_point
        
        current_point = @queue_array[0]
        previous_point = current_point.parent

        while current_point.parent != nil
          @visited_squares_array.each do |elem|
            if elem.spot == previous_point
              previous_point = elem
            end
          end
          
          @final_array << current_point.spot
          counter += 1
          current_point = previous_point
          previous_point = current_point.parent
        end
        
        @final_array << (@visited_squares_array[0].spot)
        puts "You made it in #{counter} moves!"
        @final_array.reverse_each {|elem| p elem}
        reached_end = true

      else
        current_point.children.each do |child|
          board.each do |elem|
            if elem[0] == child
              child = elem
            end
          end
    
          child = Square.new(child)
          child.parent = current_point.spot
          if @visited_squares_array.any? {|elem| elem.spot == child.spot}
            nil
          else
            @queue_array << child
          end
        end
        
        @visited_squares_array << @queue_array[0]
        @queue_array.shift
        current_point = @queue_array[0]
      end
    end
  end

end