require 'lib/arrow.rb'

class DiagonalUpArrow < Arrow
  ARROW_SIDE = 10
  ARROW_OVERHANG = 3
  LINE_SIZE = 30

  def points
    [
      [
        x,
        y+LINE_SIZE+ARROW_SIDE
      ],
      [
        x,
        y+LINE_SIZE
      ],
      [
        x+ARROW_OVERHANG,
        y+LINE_SIZE+ARROW_OVERHANG
      ],
      [
        x+LINE_SIZE+ARROW_OVERHANG,
        y+ARROW_OVERHANG
      ],
      [
        x+LINE_SIZE,
        y
      ],
      [
        x+LINE_SIZE+ARROW_SIDE,y
      ],
      [
        x+LINE_SIZE+ARROW_SIDE,
        y+ARROW_SIDE
      ],
      [
        x+LINE_SIZE+ARROW_SIDE-ARROW_OVERHANG,
        y+ARROW_SIDE-ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE-ARROW_OVERHANG,
        y+LINE_SIZE+ARROW_SIDE-ARROW_OVERHANG
      ],
      [
        x+ARROW_SIDE,
        y+LINE_SIZE+ARROW_SIDE
      ]
    ]
  end
end
