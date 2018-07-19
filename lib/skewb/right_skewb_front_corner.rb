require './lib/skewb/skewb_element'

module Skewb
  class RightSkewbFrontCorner < Skewb::SkewbElement
    def points
      [
        [
          x,
          y+units
        ],
        [
          x+2*units,
          y
        ],
        [
          x,
          y+3*units
        ]
      ]
    end
  end
end
