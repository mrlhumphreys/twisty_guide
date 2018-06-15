require 'lib/arrow.rb'

class DiagonalUpArrow < Arrow
  ARROW_SIDE = 10
  ARROW_OVERHANG = 3

  def points
    [
      [
        x,
        y+length+ARROW_SIDE
      ],
      [
        x,
        y+length
      ],
      [
        x+ARROW_OVERHANG,
        y+length+ARROW_OVERHANG
      ],
      [
        x+length+ARROW_OVERHANG,
        y+ARROW_OVERHANG
      ],
      [
        x+length,
        y
      ],
      [
        x+length+ARROW_SIDE,y
      ],
      [
        x+length+ARROW_SIDE,
        y+ARROW_SIDE
      ],
      [
        x+length+ARROW_SIDE-ARROW_OVERHANG,
        y+ARROW_SIDE-ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE-ARROW_OVERHANG,
        y+length+ARROW_SIDE-ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE,
        y+length+ARROW_SIDE
      ]
    ]
  end
end
