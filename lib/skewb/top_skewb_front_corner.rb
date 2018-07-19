require './lib/skewb/skewb_element'

module Skewb
  class TopSkewbFrontCorner < Skewb::SkewbElement
    def points
      [
        [
          x,
          y
        ],
        [
          x+4*units,
          y
        ],
        [
          x+2*units,
          y+units
        ]
      ]
    end
  end
end
