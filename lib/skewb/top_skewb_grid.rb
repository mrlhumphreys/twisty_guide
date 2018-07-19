require './lib/skewb/skewb_grid.rb'
require './lib/skewb/top_skewb_back_corner.rb'
require './lib/skewb/top_skewb_right_corner.rb'
require './lib/skewb/top_skewb_left_corner.rb'
require './lib/skewb/top_skewb_front_corner.rb'
require './lib/skewb/top_skewb_center.rb'

module Skewb
  class TopSkewbGrid < Skewb::SkewbGrid
    def element_position(row_num, col_num)
      case [row_num, col_num]
      when [0, 0]
        {
          x: x+(side_size-1)*2*units, 
          y: y
        } 
      when [0, side_size]
        {
          x: x+((side_size*2)-1)*2*units,
          y: y+(side_size-1)*units
        }
      when [side_size, 0]
        {
          x: x,
          y: y+(side_size-1)*units
        }
      when [side_size, side_size]
        {
          x: x+(side_size-1)*2*units,
          y: y+(side_size*2-1)*units
        }
      when [(side_size/2),(side_size/2)]
        {
          x: x+(side_size/2)*2*units,
          y: y+(side_size/2)*units
        }
      else
        nil
      end
    end
    
    def element_class(row_num, col_num)
      case [row_num, col_num]
      when [0, 0]
        TopSkewbBackCorner 
      when [0, side_size]
        TopSkewbRightCorner 
      when [side_size, 0]
        TopSkewbLeftCorner 
      when [side_size, side_size]
        TopSkewbFrontCorner 
      when [(side_size/2), (side_size/2)]
        TopSkewbCenter 
      else
        nil
      end
    end

    def border_points
      [
        [
          x + side_size*2*units,
          y 
        ],
        [
          x + side_size*4*units,
          y + side_size*units 
        ],
        [
          x + side_size*2*units,
          y + side_size*2*units 
        ],
        [
          x,
          y + side_size*units 
        ]
      ]
    end 

    def rows
      Array.new(side_size) do |i|
        { 
          x1: x + 2*units,
          y1: y + (2*i+1)*units,
          x2: x + 6*units,
          y2: y + (2*i+1)*units
        }
      end
    end

    def columns
      Array.new(side_size) do |i|
        { 
          x1: x + (4*i+2)*units,
          y1: y + units,
          x2: x + (4*i+2)*units,
          y2: y + 3*units
        }
      end
    end
  end
end
