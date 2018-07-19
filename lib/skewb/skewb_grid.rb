module Skewb
  class SkewbGrid
    def initialize(x:, y:, units: , elements: )
      @x, @y = x, y
      @units = units
      @elements = elements
    end

    attr_reader :x, :y, :units, :elements

    def side_size 
      elements.size - 1
    end

    def build_element(row_num, col_num, data)
      if data
        element_class = element_class(row_num, col_num)
        position = element_position(row_num, col_num) 
        if element_class
          element_class.new(x: position[:x], y: position[:y], units: units, colour: data[:colour], opacity: data[:opacity])
        else
          nil
        end
      else
        nil
      end
    end

    def border_points_string
      border_points.map { |x| x.join(',') }.join(' ') 
    end

    def element_shapes
      elements.each_with_index.map do |row, row_num|
        row.each_with_index.map do |col, col_num|
          build_element(row_num, col_num, col)
        end
      end.flatten.compact
    end

  end
end
