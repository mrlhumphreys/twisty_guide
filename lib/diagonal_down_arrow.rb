require 'lib/arrow.rb'

class DiagonalDownArrow < Arrow
  ARROW_SIDE = 10
  ARROW_OVERHANG = 3
  LINE_SIZE = 30

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
        x+(ARROW_SIDE-ARROW_OVERHANG)+LINE_SIZE,
        y+LINE_SIZE+ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE+LINE_SIZE,
        y+LINE_SIZE
      ],
      [
        x+ARROW_SIDE+LINE_SIZE,
        y+ARROW_SIDE+LINE_SIZE
      ],
      [
        x+LINE_SIZE,
        y+ARROW_SIDE+LINE_SIZE
      ],
      [
        x+LINE_SIZE+ARROW_OVERHANG,
        y+ARROW_SIDE+LINE_SIZE-ARROW_OVERHANG
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
