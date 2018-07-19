require './lib/skewb/skewb_element'

module Skewb
  class RightSkewbUpCorner < Skewb::SkewbElement
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
          x+2*units,
          y+2*units
        ]
      ]
    end
  end
end
