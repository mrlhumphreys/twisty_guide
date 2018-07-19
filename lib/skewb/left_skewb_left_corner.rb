require './lib/skewb/skewb_element'

module Skewb
  class LeftSkewbLeftCorner < Skewb::SkewbElement
    def points
      [
        [
          x,
          y
        ],
        [
          x+2*units,
          y+3*units
        ],
        [
          x,
          y+2*units
        ]
      ]
    end
  end
end
