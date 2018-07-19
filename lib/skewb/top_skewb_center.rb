require './lib/skewb/skewb_element'

module Skewb
  class TopSkewbCenter < Skewb::SkewbElement
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
          x+4*units,
          y+2*units
        ],
        [
          x,
          y+2*units
        ]
      ]
    end
  end
end
