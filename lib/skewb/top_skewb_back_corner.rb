require './lib/skewb/skewb_element'

module Skewb
  class TopSkewbBackCorner < Skewb::SkewbElement
    def points
      [
        [
          x+2*units,
          y
        ],
        [
          x+4*units,
          y+units
        ],
        [
          x,
          y+units
        ]
      ]
    end
  end
end
