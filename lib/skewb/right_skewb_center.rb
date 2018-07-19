require './lib/skewb/skewb_element'

module Skewb
  class RightSkewbCenter < Skewb::SkewbElement
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
          x+2*units,
          y+4*units
        ],
        [
          x,
          y+3*units
        ]
      ]
    end
  end
end
