require 'lib/arrow.rb'

class DiagonalDownArrow < Arrow
  ARROW_SIDE = 10
  ARROW_OVERHANG = 3

  def points
    [
      [
        x,
        y
      ],
      [
        x+ARROW_SIDE,
        y
      ],
      [
        x+ARROW_SIDE-ARROW_OVERHANG,
        y+ARROW_OVERHANG
      ],
      [
        x+(ARROW_SIDE-ARROW_OVERHANG)+length,
        y+length+ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE+length,
        y+length
      ],
      [
        x+ARROW_SIDE+length,
        y+ARROW_SIDE+length
      ],
      [
        x+length,
        y+ARROW_SIDE+length
      ],
      [
        x+length+ARROW_OVERHANG,
        y+ARROW_SIDE+length-ARROW_OVERHANG
      ],
      [
        x+ARROW_OVERHANG,
        y+ARROW_SIDE-ARROW_OVERHANG
      ],
      [
        x,
        y+ARROW_SIDE
      ]
    ]
  end
end
