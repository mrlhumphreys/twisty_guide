require './lib/skewb/skewb_element'

module Skewb
  class LeftSkewbCenter < Skewb::SkewbElement
    def points
      [
        [
          x+2*units,
          y
        ],
        [
          x+4*units,
          y+3*units
        ],
        [
          x+2*units,
          y+4*units
        ],
        [
          x,
          y+units
        ]
      ]
    end
  end
end
