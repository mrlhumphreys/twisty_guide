require './lib/skewb/skewb_element'

module Skewb
  class TopSkewbLeftCorner < Skewb::SkewbElement
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
          y+units
        ]
      ]
    end
  end
end
