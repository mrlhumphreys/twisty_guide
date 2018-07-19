require './lib/skewb/skewb_element'

module Skewb
  class RightSkewbRightCorner < Skewb::SkewbElement
    def points
      [
        [
          x+2*units,
          y
        ],
        [
          x+2*units,
          y+2*units
        ],
        [
          x,
          y+3*units
        ]
      ]
    end
  end
end
