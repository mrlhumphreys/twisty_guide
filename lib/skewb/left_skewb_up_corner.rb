require './lib/skewb/skewb_element'

module Skewb
  class LeftSkewbUpCorner < Skewb::SkewbElement
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
