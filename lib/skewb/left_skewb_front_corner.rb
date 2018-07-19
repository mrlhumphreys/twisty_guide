require './lib/skewb/skewb_element'

module Skewb
  class LeftSkewbFrontCorner < Skewb::SkewbElement
    def points
      [
        [
          x,
          y
        ],
        [
          x+2*units,
          y+units
        ],
        [
          x+2*units,
          y+3*units
        ]
      ]
    end
  end
end
