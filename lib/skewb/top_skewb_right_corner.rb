require './lib/skewb/skewb_element'

module Skewb
  class TopSkewbRightCorner < Skewb::SkewbElement
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
          x,
          y+2*units
        ]
      ]
    end
  end
end
