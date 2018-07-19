require './lib/skewb/skewb_grid.rb'
require './lib/skewb/right_skewb_front_corner.rb'
require './lib/skewb/right_skewb_up_corner.rb'
require './lib/skewb/right_skewb_right_corner.rb'
require './lib/skewb/right_skewb_down_corner.rb'
require './lib/skewb/right_skewb_center.rb'

module Skewb
  class RightSkewbGrid < Skewb::SkewbGrid
    def element_position(row_num, col_num)
      case [row_num, col_num]
      when [0, 0]
        {
          x: x, 
          y: y+(side_size-1)*units
        } 
      when [0, side_size]
        {
          x: x+(side_size-1)*2*units,
          y: y
        }
      when [side_size, 0]
        {
          x: x,
          y: y+(2*side_size)*units
        }
      when [side_size, side_size]
        {
          x: x+(side_size-1)*2*units,
          y: y+(side_size-1)*2*units
        }
      when [(side_size/2),(side_size/2)]
        {
          x: x,
          y: y+(side_size/2)*units
        }
      else
        nil
      end
    end
    
    def element_class(row_num, col_num)
      case [row_num, col_num]
      when [0, 0]
        RightSkewbFrontCorner 
      when [0, side_size]
        RightSkewbUpCorner 
      when [side_size, 0]
        RightSkewbDownCorner 
      when [side_size, side_size]
        RightSkewbRightCorner 
      when [(side_size/2), (side_size/2)]
        RightSkewbCenter 
      else
        nil
      end
    end

    def border_points
      [
        [
          x,
          y + side_size*units 
        ],
        [
          x + side_size*2*units,
          y 
        ],
        [
          x + side_size*2*units,
          y + side_size*2*units 
        ],
        [
          x,
          y + side_size*3*units 
        ]
      ]
    end 

    def rows
      Array.new(side_size) do |i|
        { 
          x1: x + (2*i)*units,
          y1: y + (i+4)*units,
          x2: x + (2*i+2)*units,
          y2: y + (i+1)*units
        }
      end
    end

    def columns
      Array.new(side_size) do |i|
        { 
          x1: x + (2*i)*units,
          y1: y + (-3*i+4)*units,
          x2: x + (i+1)*2*units,
          y2: y + (-3*i+5)*units
        }
      end
    end
  end
end
